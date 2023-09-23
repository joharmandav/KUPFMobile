import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:huawei_account/huawei_account.dart';
import 'package:kupf_mobile/app/server/database/kupf_database.dart';
import 'package:kupf_mobile/presentation/controller/login/local_auth/local_auth_controller.dart';
import 'package:local_auth/local_auth.dart';

import '../../../app/routes/routes.dart';
import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/database.dart';
import '../../../app/server/database/db_constant.dart';
import '../../../app/services/auth.dart';
import '../../../helper/toaster.dart';
import '../../models/detailed_employee_model.dart';
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
  final _apiProvider = Get.find<ApiProvider>();
  DbManager db = DbManager();
  final ConnectivityService _connectivityService = ConnectivityService();
  SocialUserInfo info = SocialUserInfo();
  RxBool rememberMe = RxBool(false);
  RxBool isPhone = RxBool(false);
  RxBool obscureText = RxBool(true);
  final formKey = GlobalKey<FormState>();
  final RxString countryCode = RxString('');

  final localAuthController = Get.put(LocalAuthController());
  RxnBool canCheckBiometrics = RxnBool();
  RxList<BiometricType> availableBiometrics = RxList<BiometricType>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  RxBool isAction = RxBool(false);

  late AccountAuthService _authService;

  @override
  void onInit() {
    super.onInit();
    _connectivityService.initConnectivity();


    final AccountAuthParamsHelper authParamsHelper = AccountAuthParamsHelper()
      ..setProfile()
      ..setAccessToken();
    final AccountAuthParams authParams = authParamsHelper.createParams();
    _authService = AccountAuthManager.getService(authParams);
  }

  // @override
  // void onClose() {
  //   isAction(false);
  //   emailController.clear();
  //   passwordController.clear();
  //   phoneController.clear();
  //   super.onClose();
  // }



  void login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    Get.focusScope!.unfocus();
    isAction(true);
    final String userName = isPhone.value ? countryCode.value + phoneController.text : emailController.text;
    Get.log(userName);
    final controller = Get.find<GeneralController>();
    String device = await controller.deviceID();
    DetailedEmployeeModel? result;
    bool isOnline = await _connectivityService.checkConnectivity();
    if (isOnline) {
      try {
        result = await loginApi(userName, passwordController.text);
      } on Exception catch (e) {
        Toaster.showError(e.toString());
      }
    } else {
      result = await loginWithDB(userName, passwordController.text, device);
    }
    if (result == null) {
      isAction(false);
      Toaster.showError("User not found");
      return;
    }
      controller.detailedEmployeeModel = result;
    controller.storageBox.write("device", device);
    await controller.storageBox.write('status', 1);
    await controller.storageBox.write('employeeID', result.employeeID);
    await controller.storageBox.write('token', result.token);
    if (isPhone.value) {
      await controller.storageBox.write('phone', userName);
    } else {
      await controller.storageBox.write('email', userName);
    }
    await controller.storageBox.write('password', passwordController.text);
    isAction(false);
    navigation();
  }

  Future<DetailedEmployeeModel?> loginApi(String username, String password) async {
    try {
      var response = await _apiProvider.loginEmployee(username, password);
      if (response == null) return null;
      DetailedEmployeeModel detailedEmployeeModel = DetailedEmployeeModel.fromJson(response);

      String device = await Get.find<GeneralController>().deviceID();
      var res = await db.getLogin(username, password, device);
      if(res == null){
        db.insert(Constants.detailedEmployeeTable, detailedEmployeeModel);
      }
      return detailedEmployeeModel;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<DetailedEmployeeModel?> loginWithDB(String username, String password, String deviceID) async {
    try {
      return await db.getLogin(username, password, deviceID);
    } on Exception catch (e) {
      Toaster.showError("Error:: ${e.toString()}");
      return null;
    }
  }

  Future<void> localAuth() async {
    if (!localAuthController.isEnable) {
      Toaster.showToast("Please  enable biometrics");
      return;
    }

    bool auth = await localAuthController.authenticate();

    if (!auth) return;
    final controller = Get.find<GeneralController>();
    String device = await controller.deviceID();

    String? phone = controller.storageBox.read('phone');
    String? email = controller.storageBox.read('email');
    String? password = controller.storageBox.read('password');
    String username = email ?? phone ?? "";
    isAction(true);
    DetailedEmployeeModel? result;
    if (await _connectivityService.checkConnectivity()) {
      try {
        result = await loginApi(username, password!);
      } on Exception catch (e) {
        isAction(false);
        Toaster.showError(e.toString());
        return;
      }
    } else {
      result = await loginWithDB(username, password!, device);
    }

    if (result == null) {
      isAction(false);
      Toaster.showError("User not found");
      return;
    }

    controller.detailedEmployeeModel = result;
    controller.storageBox.write("device", device);
    await controller.storageBox.write('status', 1);
    isAction(false);
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
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

  // Future<void> signInWithFaceBook() async {
  //   isAction(true);
  //   SocialUserInfo? info =
  //   await authServices.facebookSignIn();
  //   if (info == null) {
  //     isAction(false);
  //     return;
  //   }
  //   Get.find<GeneralController>()
  //       .storageBox
  //       .write('status', 1);
  //   isAction(false);
  //   navigation();
  // }

  Future<void> signInWithApple() async {
    SocialUserInfo? info = await authServices.appleSignIn();
    if (info == null) return;
  }

  void navigation() {
    if (Get.find<GeneralController>().readData('route') != null) {
      Get.back(result: true);
      return;
    }
    Get.offAllNamed(AppRoutes.home);
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