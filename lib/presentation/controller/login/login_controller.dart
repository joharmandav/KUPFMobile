import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:huawei_account/huawei_account.dart';
import 'package:kupf/app/server/database/kupf_database.dart';
import 'package:local_auth/local_auth.dart';

import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/database.dart';
import '../../../app/server/database/db_constant.dart';
import '../../../app/services/auth.dart';
import '../../../helper/toaster.dart';
import '../../screen/main_view/main_view.dart';
import '../connectivity_controller.dart';
import '../main/general_controller.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginController extends GetxController {
  AuthServices authServices = AuthServices();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  DbManager db = DbManager();
  final ConnectivityService _connectivityService = ConnectivityService();
  SocialUserInfo info = SocialUserInfo();
  RxBool rememberMe = RxBool(false);
  RxBool isPhone = RxBool(false);
  RxBool obscureText = RxBool(true);
  final formKey = GlobalKey<FormState>();
  final RxString countryCode = RxString('');

  final LocalAuthentication auth = LocalAuthentication();
  final Rx<SupportState> _supportState = Rx<SupportState>(SupportState.unknown);
  RxnBool canCheckBiometrics = RxnBool();
  RxList<BiometricType> availableBiometrics = RxList<BiometricType>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxBool isAction = RxBool(false);

  late AccountAuthService _authService;

  @override
  void onInit() {
    super.onInit();
    _connectivityService.initConnectivity();
    auth.isDeviceSupported().then(
          (bool isSupported) => _supportState.value = isSupported
          ? SupportState.supported
          : SupportState.unsupported,
    );

    final AccountAuthParamsHelper authParamsHelper = AccountAuthParamsHelper()
      ..setProfile()
      ..setAccessToken();
    final AccountAuthParams authParams = authParamsHelper.createParams();
    _authService = AccountAuthManager.getService(authParams);
  }

  @override
  void onClose() {
    isAction(false);
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    cancelAuthentication();
    super.onClose();
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      Get.log(e.message!);
    }

      availableBiometrics.assignAll(availableBiometrics);
  }


  Future<void> authenticate() async {
    if (!await auth.canCheckBiometrics) {
      Toaster.showError("Can't check biometrics");
    }
    try {
      await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      Get.log(e.message!);
      return;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    if (!await auth.canCheckBiometrics) {
      Toaster.showError("Can't check biometrics");
    }
    try {
      await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      Get.log(e.message!);
      return;
    }
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }

  void login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    Get.focusScope!.unfocus();
    isAction(true);
    final String userName = isPhone.value ? countryCode.value + phoneController.text : emailController.text;
    Get.log(userName);
    String device = await deviceID();
    final controller = Get.find<GeneralController>();
    if (await _connectivityService.checkConnectivity()) {
      try {
        final result = await ApiProvider().loginEmployee(userName, passwordController.text);
      } on Exception catch (e) {
        Toaster.showError(e.toString());
      }

    } else {
      final result = await db.getLogin(userName, passwordController.text, device);
      if (result == null) {
        isAction(false);
        Toaster.showError("User not found");
        return;
      }
      controller.detailedEmployeeModel = result;
    }
    controller.storageBox.write("device", device);
    await controller.storageBox.write('status', 1);
    if (isPhone.value) {
      await controller.storageBox.write('phone', emailController.text);
    } else {
      await controller.storageBox.write('email', emailController.text);
    }
    await controller.storageBox.write('password', passwordController.text);
    isAction(false);
    navigation();
  }

  void signInWithHuawei() async {
    isAction(true);
    try {
      final AuthAccount account = await _authService.signIn();
      info.email = account.email;
      info.name = account.displayName;
      info.id = account.unionId;
      info.picture = account.avatarUri;

      Get.log('FROM SIGN IN: ${account.toMap().toString()}');
      await DatabaseManager().insert(Constants.socialUserInfoTable, info);
      Get.find<GeneralController>().storageBox.write('status', 1);
      isAction(false);
      navigation();
    } on Exception catch (e) {
      Toaster.showError("Huawei Sign Error: ${e.toString()}");
      Get.log(e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    isAction(true);
    SocialUserInfo? info = await authServices.googleSignIn();
    if (info == null) {
      isAction(false);
      return;
    }
    Get.find<GeneralController>()
        .storageBox
        .write('status', 1);
    isAction(false);
    navigation();
  }

  Future<void> signInWithFaceBook() async {
    isAction(true);
    SocialUserInfo? info =
    await authServices.facebookSignIn();
    if (info == null) {
      isAction(false);
      return;
    }
    Get.find<GeneralController>()
        .storageBox
        .write('status', 1);
    isAction(false);
    navigation();
  }

  Future<void> signInWithApple() async {
    SocialUserInfo? info = await authServices.appleSignIn();
    if (info == null) return;
  }

  void navigation() {
    if (Get.find<GeneralController>().readData('route') != null) {
      Get.back(result: true);
      return;
    }
    Get.offAll(() => const MainView());
  }

  Future<String> deviceID() async {
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? "";
    }
    return "";
  }


  Future<bool> checkDevice() async {
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.manufacturer != "Google";
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return false;
    }
    return false;
  }
}