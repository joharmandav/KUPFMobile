import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kupf_mobile/app/services/auth.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/presentation/models/detailed_employee_model.dart';

class GeneralController extends GetxController {
  GetStorage storageBox = GetStorage();
  var token = ''.obs;

   @override
  void onInit() {
    super.onInit();
    // Load token if it exists
    token.value = storageBox.read('token') ?? '';
  }


   Future<void> saveBearerToken(String newToken) async {
    token.value = newToken;
    await storageBox.write('token', newToken);
    print("NEW TOKEN SAVED: $newToken");
  }

 Future<String?> getBearerToken() async {
  final storage = GetStorage();
  String? token = storage.read('bearerToken');
  if (token == null || token.isEmpty) {
    print('Token is null or empty');
  }else{
    print("BEARER TOKEN PRESENT: $token");
  }
  return token;
}

  Locale? selectedLocale;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final Rxn<DetailedEmployeeModel> _detailedEmployeeModel = Rxn<DetailedEmployeeModel>();
  // final Rxn<CRUPAuditModel> _crupAuditModel = Rxn<CRUPAuditModel>();
  // final Rxn<FunctionMSTModel> _functionMSTModel = Rxn<FunctionMSTModel>();
  // final Rxn<FunctionUserModel> _functionUserModel = Rxn<FunctionUserModel>();

  final RxInt _status = RxInt(0);

  
    

  bool checkStatus() {
    if (storageBox.hasData('status') && storageBox.read('status') == 1) {
      _status(storageBox.read('status'));
      return true;
    } else {
      storageBox.write('status', 0);
      _status(storageBox.read('status'));
      return false;
    }
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

  Future<void> storeData(String key, dynamic value) async {
    await storageBox.write(key, value);
  }

  dynamic readData(String key) {
    if (storageBox.hasData(key)) {
      return storageBox.read(key);
    }
    return null;
  }

  int get status => _status.value;

  List<Locale> localeList = [
    const Locale('en', 'US'),
    const Locale('ar', ''),
  ];

  Future<void> logout() async {
    storageBox.write('status', 0);
    storageBox.remove("route");
    _status(0);
    _detailedEmployeeModel.value = null;
    await AuthServices.logout();
  }

  checkLanguage() {
    if (storageBox.hasData('languageIndex')) {
      updateSelectedLocale(localeList[int.parse(storageBox.read('languageIndex').toString())]);
    } else {
      storageBox.write('languageCode', localeList[0].languageCode);
      storageBox.write('countryCode', localeList[0].countryCode);
      storageBox.write('languageIndex', 0);
      updateSelectedLocale(localeList[0]);
    }
  }

  bool isArabic() {
    if (storageBox.hasData('languageCode')) {
      return storageBox.read('languageCode') == 'ar';
    } else {
      return false;
    }
  }

  updateSelectedLocale(Locale? newValue) {
    selectedLocale = newValue;
    update();
  }

  Rxn<Color> primaryColor = Rxn<Color>();

  Color? checkColor() {
    if (storageBox.hasData('color')) {
      return updateSelectedColor(HexColor(storageBox.read('color')));
    } else {
      String value = "#567DF4";
      storageBox.write('color', value);
      return updateSelectedColor(mainColor.value);
    }
  }

  Color? updateSelectedColor(Color? newValue) {
    primaryColor(newValue);
    return primaryColor.value;
  }

  DetailedEmployeeModel? get detailedEmployeeModel => _detailedEmployeeModel.value;

  set detailedEmployeeModel(DetailedEmployeeModel? value) {
    _detailedEmployeeModel(value);
  }
}