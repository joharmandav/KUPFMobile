import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/helper/toaster.dart';

import '../connectivity_controller.dart';

class SignInWithMobileController extends GetxController {

  final RxBool _isTaped = RxBool(true);
  final RxInt _start = RxInt(40);
  final RxBool _hasError = RxBool(false);
  bool? isLogin = false;
  final RxBool _isActive = RxBool(true);
  final RxnString countryCode = RxnString();

  late var _timer;
  final RxString _currentText = RxString("");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  int get countDown => _start.value;

  bool get isActive => _isActive.value;


  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  RxBool otpSent = RxBool(false);
  RxBool isLoading = RxBool(false);
  RxString sourceCode = RxString('');

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (countDown < 1) {
          _isActive(false);
          timer.cancel();
        } else {
          _isActive(true);
          _start(countDown - 1);
        }
      },
    );
  }

  void reSend() async {
    final ConnectivityService connectivityService = ConnectivityService();
    await connectivityService.initConnectivity();
    if (!await connectivityService.checkConnectivity()) {
      ConnectivityService.internetErrorDialog();
      return;
    }

    if (_timer.isActive) {
      return;
    } else {
      _timer.cancel();
      startTimer();
      _start(60);
    }
  }

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    Get.focusScope!.unfocus();
    if (otpSent.value) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId:
          sourceCode.value,
          smsCode: otpController.text,
      );
      UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCreds.user!.phoneNumber != null) {

      } else {
        Toaster.showError(
            "User not found, Please signup to continue",);
      }
    } else {
      if (!formKey.currentState!.validate()) return;
      if (countryCode.value == null) {
        Toaster.showError("Please select country code");
        return;
      }
      formKey.currentState!.save();
      Get.focusScope!.unfocus();
      isLoading(true);
      await FirebaseAuth.instance
          .verifyPhoneNumber(
        phoneNumber: countryCode.value! + phoneController.text,
        verificationCompleted:
            (PhoneAuthCredential
        credential) {
          isLoading(false);
          otpSent(true);
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading(false);
          Toaster.showError("${e.message}");
        },
        codeSent: (verificationId, resendToken) {
          isLoading(false);
          otpSent(true);
          sourceCode(verificationId);
        },
        codeAutoRetrievalTimeout:
            (String verificationId) {},
      );
    }
  }


  bool get isTaped => _isTaped.value;

  set isTaped(bool value) {
    _isTaped(value);
  }
}