import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../helper/toaster.dart';

class LocalAuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  final RxBool _isSupported = RxBool(false);
  final RxBool _isEnabled = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    auth.isDeviceSupported().then(
          (bool isSupported) => _isSupported.value = isSupported
    );
    _isEnabled(Get.find<GeneralController>().storageBox.read("link") ?? false);
  }


  @override
  void onClose() {
    auth.stopAuthentication();
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

  Future<bool> hasBiometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      Toaster.showError(e.message!);
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      return await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      Toaster.showError(e.message!);
      return false;
    }
  }


  Future<bool> authenticate() async {
    if (!await hasBiometrics()) {
      Toaster.showError("Can't check biometrics");
    }
    try {
      return await auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
          // biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      Toaster.showError(e.message!);
      return false;
    }
  }

  bool get isEnable => _isEnabled.value;

  bool get isSupported => _isSupported.value;
}
