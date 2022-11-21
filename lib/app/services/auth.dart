import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../helper/toaster.dart';
import '../server/database/database.dart';
import '../server/database/db_constant.dart';

class AuthServices {
  final fbLogin = FacebookAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final firebaseAuth = FirebaseAuth.instance;

  Future<SocialUserInfo?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      SocialUserInfo info = SocialUserInfo();
      if (credential.user != null) {
        info.email = credential.user!.email;
        info.name = credential.user!.displayName;
        info.picture = credential.user!.photoURL;
        info.id = credential.user!.uid;
        await DatabaseManager().insert(Constants.socialUserInfoTable, info);
        return info;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Toaster.showError("The password provided is too weak.");
      } else if (e.code == 'user-not-found') {
        Toaster.showError("Email or Password is not correct. ${e.code}");
      } else {
        Toaster.showError('Email or Password Error: ${e.toString()}');
      }
      return null;
    } catch (e) {
      Toaster.showError("Email or Password Error: ${e.toString()}");
      return null;
    }
  }

  Future<SocialUserInfo?> appleSignIn() async {
    bool isAvailable = await SignInWithApple.isAvailable();
    if (!isAvailable) {
      Toaster.showError(
          "Sign in with Apple not available. Must be run on iOS 13+");
      return null;
    }

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final result = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: result.identityToken,
      rawNonce: rawNonce,
    );

    if (result.state == null) {
      return null;
    }

    // UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    SocialUserInfo info = SocialUserInfo();

    CredentialState status =
        await SignInWithApple.getCredentialState(result.userIdentifier!);

    switch (status) {
      case CredentialState.authorized:
        info.name = "${result.givenName} ${result.familyName}";

        info.id = result.userIdentifier;
        info.email = result.email;
        return info;
      case CredentialState.notFound:
        Toaster.showError("Sign in failed: ${result.email}");
        break;
      case CredentialState.revoked:
        Toaster.showError('User cancelled');
        break;
    }

    return null;
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<SocialUserInfo?> googleSignIn() async {
    try {
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
      SocialUserInfo info = SocialUserInfo();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await signInAccount?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        info.email = userCredential.user!.email;
        info.name = userCredential.user!.displayName;
        info.picture = userCredential.user!.photoURL;
        info.id = userCredential.user!.uid;
        await DatabaseManager().insert(Constants.socialUserInfoTable, info);
        // info.dateOfBirth = userCredential.user!
        return info;
      }

      // Toaster.showConfirm("Welcome to KUPF ${info.name}");
      return null;
    } catch (e) {
      print("Google Sign Error: $e");
      Toaster.showError("Google Sign Error: ${e.toString()}");
    }
    return null;
  }

  Future<SocialUserInfo?> facebookSignIn() async {
    // Trigger the sign-in flow
    final LoginResult result = await fbLogin.login();
    if (result.accessToken != null && result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      UserCredential loginResult = await firebaseAuth.signInWithCredential(facebookAuthCredential);

      // final userData = await fbLogin.getUserData();

      try {
        SocialUserInfo info = SocialUserInfo();
        info.name = loginResult.user!.displayName;
        info.email = loginResult.user!.email;
        info.id = loginResult.user!.uid;
        info.picture = loginResult.user!.photoURL;

        await DatabaseManager().insert(Constants.socialUserInfoTable, info);

        return info;
      } catch (e) {
        print("Facebook Sign Error: $e");
        Toaster.showError("Facebook Sign Error: ${e.toString()}");
      }
    }
    return null;
  }

  static Future<void> logout() async {
    firebaseAuth.signOut();
  }
}

class SocialUserInfo {
  String? name;
  String? email;
  String? id;
  String? picture;
  String? phone;
  String? dateOfBirth;
  String? gender;
  String? maritalStatus;
  String? typeValue;

  SocialUserInfo({
    this.name = "",
    this.email = "",
    this.id = "",
    this.picture = "",
    this.phone = "",
    this.dateOfBirth = "",
    this.maritalStatus = "",
    this.gender = "",
  });

  factory SocialUserInfo.fromMap(Map<String, dynamic> map) => SocialUserInfo(
        name: map[Constants.name],
        phone: map[Constants.phone],
        id: map[Constants.id],
        dateOfBirth: map[Constants.dateOfBirth],
        email: map[Constants.email],
        gender: map[Constants.gender],
        maritalStatus: map[Constants.maritalStatus],
        picture: map[Constants.picture],
      );

  Map<String, dynamic> toMap() => {
        Constants.name: name ?? '',
        Constants.phone: phone ?? '',
        Constants.gender: gender ?? '',
        Constants.email: email ?? '',
        Constants.maritalStatus: maritalStatus ?? '',
        Constants.picture: picture ?? '',
        Constants.id: id ?? '',
        Constants.dateOfBirth: dateOfBirth ?? ''
      };
}
