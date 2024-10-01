import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:huawei_account/huawei_account.dart';
import 'package:kupf_mobile/app/server/database/kupf_database.dart';
import 'package:kupf_mobile/presentation/controller/login/local_auth/local_auth_controller.dart';
import 'package:kupf_mobile/presentation/models/login_response_model.dart';
import 'package:local_auth/local_auth.dart';

import '../../../app/routes/routes.dart';
import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/database.dart';
import '../../../app/server/database/db_constant.dart';
import '../../../app/services/auth.dart';
import '../../../helper/toaster.dart';
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
  RxBool isPhone = RxBool(true);
  RxBool obscureText = RxBool(true);
  final formKey = GlobalKey<FormState>();
  final RxString countryCode = RxString('');

  final localAuthController = Get.put(LocalAuthController());
  RxnBool canCheckBiometrics = RxnBool();
  RxList<BiometricType> availableBiometrics = RxList<BiometricType>();

  final employeeIdController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  RxBool isAction = RxBool(false);
  final RxBool isFirstTimeLogin = false.obs;

  late AccountAuthService _authService;
  // login selection seitch
  var selectedLoginType = 'Mobile'.obs; 
   final TextEditingController seletionController = TextEditingController();
   


  void changeLoginType(String type) {
    selectedLoginType.value = type;
  }
     final controller = Get.find<GeneralController>();



  @override
  void onInit() {
    super.onInit();
    _connectivityService.initConnectivity();

    loadUserCredentials();
    final AccountAuthParamsHelper authParamsHelper = AccountAuthParamsHelper()
      ..setProfile()
      ..setAccessToken();
    final AccountAuthParams authParams = authParamsHelper.createParams();
    _authService = AccountAuthManager.getService(authParams);
  }

  // void loadUserCredeentials(){
  //  if (controller.storageBox.read('rememberMe') ?? false) {
  //    phoneController.text = controller.storageBox.read('username') ?? '';
  //     passwordController.text = controller.storageBox.read('password') ?? '';
  //     rememberMe.value = true;
  //   }
  // }
  void loadUserCredentials() {
  if (controller.storageBox.read('rememberMe') ?? false) {    
    // Load the last used login type (Mobile or EmployeeId)
    String loginType = controller.storageBox.read('loginType') ?? 'Mobile';
    
    if (loginType == 'Mobile') {
      isPhone.value = true;  // Set the toggle to phone login
      selectedLoginType.value = 'Mobile'; 
       phoneController.text = controller.storageBox.read('mobileCreds') ?? '';
    } else if (loginType == 'EmployeeId') {
      isPhone.value = false;  // Set the toggle to employee ID login
      selectedLoginType.value = 'EmployeeId';
    employeeIdController.text = controller.storageBox.read('employeeIDCreds') ?? '';
    }

    passwordController.text = controller.storageBox.read('password') ?? '';
    rememberMe.value = true;

    // Simply update the toggle without hiding any fields
    updateLoginFieldLabel();
  }
}

void updateLoginFieldLabel() {
  // Just switch the focus or label, keep both fields visible
  if (isPhone.value) {
    // Optionally update the label to indicate phone input is expected
    // For example: "Enter Mobile Number"
  } else {
    // Optionally update the label to indicate employee ID input is expected
    // For example: "Enter Employee ID"
  }
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
   
    final String userName = isPhone.value ? countryCode.value + phoneController.text : employeeIdController.text;
    
    Get.log(userName);
    String type;
    // container only digits
    if(userName.startsWith('+') && userName.length > 10 && userName.length < 15){
      type = "Mobile";
    }else if(userName.contains('@')){
     type = "Email";
    }else{
      type = "EmployeeId";
    }
    
   final controller = Get.find<GeneralController>();
    String device = await controller.deviceID();
    LoginResModel? result;
    bool isOnline = await _connectivityService.checkConnectivity();
    if (isOnline) {
      try {
        result = await loginApi(userName, passwordController.text,type);
      } on Exception catch (e) {
        Toaster.showError(e.toString());
      }
    } else {
      result = await loginWithDB(userName, passwordController.text, type);
    }
    if (result == null) {
      isAction(false);
      Toaster.showError("User not found");
      return;
    }
    controller.detailedEmployeeModel = result;
    
    controller.storageBox.write("device", device);
    await controller.storageBox.write('status', 1);
    await controller.storageBox.write('employeeId', result.employeeId);
    await controller.storageBox.write('tenentId', result.tenentId);
    await controller.storageBox.write('locationId', result.locationId);
   await controller.storageBox.write('loginType', type);

  
    // await controller.storageBox.write('token', result.t);
    if (isPhone.value) {
    String purePhoneNumber = phoneController.text.replaceFirst(countryCode.value, '');
     type = "Mobile";
      await controller.storageBox.write('mobileCreds', purePhoneNumber);
    } else {
      type = "EmployeeId";
    await controller.storageBox.write('employeeIDCreds', employeeIdController.text) ;
    }
    await controller.storageBox.write('password', passwordController.text);
   

  //  TODO SYNCHING API CALL LATER 
    // String emplyId = result.employeeId.toString();
    // int? tntId  = result.tenentId;
    // int? locId = result.locationId;

      // await syncEmployeeApi(emplyId,tntId??0,locId??0 );
    isAction(false);
    navigation();
  }

  Future<LoginResModel?> syncEmployeeApi(String employeeId,int teantId,int locationId) async{
   try{
    var response = await _apiProvider.getEmployeeSync(employeeId, teantId, locationId);
    if(response == null) return null;
   LoginResModel syncEmployeeModel = LoginResModel.fromJson(response);
    return syncEmployeeModel;

   } on Exception catch(e){
    Toaster.showError(e.toString());
   }
   return null;
  }
  

  Future<LoginResModel?> loginApi(String username, String password,String type) async {
    try {
      var response = await _apiProvider.loginEmployee(username, password,type);
      if (response == null) return null;
      LoginResModel detailedEmployeeModel = LoginResModel.fromJson(response);
      return detailedEmployeeModel;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<LoginResModel?> loginWithDB(String username, String password, String deviceID) async {
    try {
      return await db.getLogin(username, password, deviceID);
    } on Exception catch (e) {
      Toaster.showError("Error:: ${e.toString()}");
      return null;
    }
  }
// comment out later for bio metrics
  // Future<void> localAuth() async {
  //   if (!localAuthController.isEnable) {
  //     Toaster.showToast("Please  enable biometrics");
  //     return;
  //   }

  //   bool auth = await localAuthController.authenticate();

  //   if (!auth) return;
  //   final controller = Get.find<GeneralController>();
  //   String device = await controller.deviceID();

  //   String? phone = controller.storageBox.read('phone');
  //   String? email = controller.storageBox.read('email');
  //   String? password = controller.storageBox.read('password');
  //   String username = email ?? phone ?? "";
  //   isAction(true);
  //   DetailedEmployeeModel? result;
  //   if (await _connectivityService.checkConnectivity()) {
  //     try {
  //       result = await loginApi(username, password!);
  //     } on Exception catch (e) {
  //       isAction(false);
  //       Toaster.showError(e.toString());
  //       return;
  //     }
  //   } else {
  //     result = await loginWithDB(username, password!, device);
  //   }

  //   if (result == null) {
  //     isAction(false);
  //     Toaster.showError("User not found");
  //     return;
  //   }

  //   controller.detailedEmployeeModel = result;
  //   controller.storageBox.write("device", device);
  //   await controller.storageBox.write('status', 1);
  //   isAction(false);
  //   emailController.clear();
  //   phoneController.clear();
  //   passwordController.clear();
  //   navigation();
  // }

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