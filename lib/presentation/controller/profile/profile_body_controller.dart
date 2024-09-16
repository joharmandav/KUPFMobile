import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kupf_mobile/app/server/api/api_provider.dart';
import 'package:kupf_mobile/app/server/database/kupf_database.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:kupf_mobile/presentation/models/detailed_employee_model.dart';
import 'package:kupf_mobile/presentation/models/ref_table_model.dart';

import '../../../helper/toaster.dart';
import '../../../languages/language_constants.dart';
import '../connectivity_controller.dart';

class ProfileBodyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _apiProvider = Get.find<ApiProvider>();
  final DbManager db = DbManager();
  final controller = Get.find<GeneralController>();
  final ConnectivityService _connectivityService = ConnectivityService();
  final RxBool _isLoading = RxBool(false);
  late final TabController _tabController;

  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController arabicNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController landLineController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nextToKinMobileController =
      TextEditingController();
  final TextEditingController nextToKinNameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController paciController = TextEditingController();
  final TextEditingController otherIDController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  int tenantID = 21;
  String RejectedDate = "2024-09-12T12:34:56";

  
  DetailedEmployeeModel? detailedEmployeeModel;

  RxnString gender = RxnString();
  RxnString marital = RxnString();
  Rxn<RefTableModel> department = Rxn<RefTableModel>();
  Rxn<RefTableModel> occupation = Rxn<RefTableModel>();

  final RxList<RefTableModel> _departmentList = RxList<RefTableModel>();

  final RxList<RefTableModel> _occupationList = RxList<RefTableModel>();

  Rxn<XFile> pickedFile = Rxn<XFile>();

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 2, vsync: this);
    _connectivityService.initConnectivity();
    init();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  Future<void> getDepartment() async {
    final departmentResult = await db.getDepartments();
    if (departmentResult.isEmpty) return;
    Get.log(departmentResult.length.toString());
    _departmentList.assignAll(departmentResult);
    if (detailedEmployeeModel!.department != null &&
  detailedEmployeeModel!.department != 0) {
      department.value = _departmentList.firstWhere(
          (element) => element.refID == detailedEmployeeModel!.department);
    }
  }

  Future<void> getOccupation() async {
    final occupationResults = await db.getOccupation();
    if (occupationResults.isEmpty) return;
    Get.log(occupationResults.length.toString());
    _occupationList.assignAll(occupationResults);
    if (detailedEmployeeModel!.departmentName != null &&
        detailedEmployeeModel!.departmentName!.isNotEmpty) {
      try {
        occupation.value = _occupationList.firstWhere((element) =>
            element.shortName == detailedEmployeeModel!.departmentName,
            // returning first itel wwr no match is foun
            orElse: (){
              return _occupationList[0];
            }
            );
            
      } on Exception catch (e) {
        Toaster.showError(e.toString());
      }
    }
  }

  // Future<void> updateProfile() async {
  //   detailedEmployeeModel!.englishName = employeeNameController.text;
  //   detailedEmployeeModel!.arabicName = arabicNameController.text;
  //   detailedEmployeeModel!.empBirthday = dobController.text;
    
  //   detailedEmployeeModel!.empGender =  
  //       gender.value != null && gender.value == LanguageConstants.male.tr
  //           ? 1
  //           : 0;
  //   detailedEmployeeModel!.empMaritalStatus =
  //       marital.value != null && marital.value == LanguageConstants.married.tr
  //           ? 1
  //           : 0;
  //   detailedEmployeeModel!.mobileNumber = mobileController.text;
  //   detailedEmployeeModel!.empWorkTelephone = landLineController.text;
  //   detailedEmployeeModel!.empWorkEmail = emailController.text;
  //   detailedEmployeeModel!.next2KinMobNumber = nextToKinMobileController.text;
  //   detailedEmployeeModel!.next2KinName = nextToKinNameController.text;
  //   detailedEmployeeModel!.salary = int.tryParse(salaryController.text) ?? 0;
  //   detailedEmployeeModel!.empPaciNum = paciController.text;
  //   detailedEmployeeModel!.empOtherId = otherIDController.text;
  //   detailedEmployeeModel!.departmentName = occupation.value?.shortName ?? "";
  //   detailedEmployeeModel!.department = department.value?.refID ?? 0;
  //   detailedEmployeeModel!.uploadBy = pickedFile.value?.path ?? "";
  //   if (controller.status == 0) return;
  //   if (!await _connectivityService.checkConnectivity()) {
  //     ConnectivityService.internetErrorDialog();
  //     return;
  //   }

  //   _isLoading(true);

  //   dynamic response = await _apiProvider
  //       .updateEmployeeProfile(detailedEmployeeModel!.toJson());
  //       print("  RED MODEL: ${detailedEmployeeModel!.toJson()}");

  //   if (response == null) {
  //     _isLoading(false);
  //     return;
  //   }
  //   Toaster.showConfirm("Successfully Updated");
  //   await db.updateEmployeeDetails(detailedEmployeeModel!);
  //   _isLoading(false);
  //   controller.detailedEmployeeModel = detailedEmployeeModel!;
  // }
   
   Future<void> updateProfile() async {
    final generalController = GeneralController();
    
    // String bearertoken = "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI5OTUwMTU2NiIsImV4cCI6MTcyNjY0ODE0NCwiaXNzIjoibG9jYWxob3N0IiwiYXVkIjoibG9jYWxob3N0In0.3fVvDqShH7jhPMtPuS4WZXi3K4qBz_bfhsRgl1k5x4DVTnENanPIUeJXnvLQTFY9CwfBDlFNaofOtI4kf9PPJw";
   String? bearertoken = await generalController.getBearerToken();
  // Updating model with controller values
  detailedEmployeeModel!.englishName = employeeNameController.text;
  detailedEmployeeModel!.arabicName = arabicNameController.text;
  detailedEmployeeModel!.empBirthday = dobController.text;
  detailedEmployeeModel!.empGender =  
      gender.value != null && gender.value == LanguageConstants.male.tr
          ? 1
          : 0;
  detailedEmployeeModel!.empMaritalStatus =
      marital.value != null && marital.value == LanguageConstants.married.tr
          ? 1
          : 0;
  detailedEmployeeModel!.mobileNumber = mobileController.text;
  detailedEmployeeModel!.empWorkTelephone = landLineController.text;
  detailedEmployeeModel!.empWorkEmail = emailController.text;
  detailedEmployeeModel!.next2KinMobNumber = nextToKinMobileController.text;
  detailedEmployeeModel!.next2KinName = nextToKinNameController.text;
  detailedEmployeeModel!.salary = int.tryParse(salaryController.text) ?? 0;
  detailedEmployeeModel!.empPaciNum = paciController.text;
  detailedEmployeeModel!.empOtherId = otherIDController.text;
  detailedEmployeeModel!.departmentName = occupation.value?.shortName ?? "";
  detailedEmployeeModel!.department = department.value?.refID ?? 0;
  detailedEmployeeModel!.tenentId = tenantID;
  detailedEmployeeModel!.rejectedDate = RejectedDate;


  if (controller.status == 0) return;
  if (await _connectivityService.checkConnectivity()) {
    ConnectivityService.internetErrorDialog();
    return;
  }

  _isLoading(true);

  // Prepare payload
  Map<String, dynamic> payload = detailedEmployeeModel!.toJson();


  

  // Check for fields that were not updated (i.e., remain null or default)
  Map<String, dynamic> unsentFields = {};
  detailedEmployeeModel!.toJson().forEach((key, value) {
    if (value == null || value == '') {
      unsentFields[key] = value;
    }
  });

  // Print unsent fields
  print("Fields not being sent (null or empty): $unsentFields");

  // Make the API request
  dynamic response = await _apiProvider.updateEmployeeProfile(payload,bearertoken??"");
  print("  RED MODEL: ${detailedEmployeeModel!.toJson()}");

  if (response == null) {
    _isLoading(false);
    return;
  }
  
  // Handle success
  Toaster.showConfirm("Successfully Updated");
  await db.updateEmployeeDetails(detailedEmployeeModel!);
  _isLoading(false);
  controller.detailedEmployeeModel = detailedEmployeeModel!;
}

  Future<void> init() async {
    if (controller.checkStatus()) return;
    // String device = await controller.deviceID();
    _isLoading(true);
    if (await _connectivityService.checkConnectivity()) {
      try {
        print(controller.storageBox.read("employeeID").runtimeType);
        detailedEmployeeModel =
            await _apiProvider.getEmployeeProfileById(controller.storageBox.read("employeeID"));
      } on Exception catch (e) {
        _isLoading(false);
        Toaster.showError(e.toString());
        return;
      }
    } else {
      detailedEmployeeModel = await db.getLogin(
          controller.storageBox.read("email") ??
              controller.storageBox.read("phone"),
          controller.storageBox.read("password"),
          controller.storageBox.read("device"));
    }
    _isLoading(false);
    if (detailedEmployeeModel == null) {
      controller.storageBox.write("status", 0);
      return;
    }

    controller.detailedEmployeeModel = detailedEmployeeModel!;
    employeeNameController.text = detailedEmployeeModel!.englishName!;
    arabicNameController.text = detailedEmployeeModel!.arabicName!;
    dobController.text = detailedEmployeeModel?.empBirthday != null ? DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(detailedEmployeeModel?.empBirthday ?? "")) : "";
    gender.value = detailedEmployeeModel!.empGender != null &&
            detailedEmployeeModel!.empGender == 1
        ? LanguageConstants.male.tr
        : LanguageConstants.female.tr;
    marital.value = detailedEmployeeModel!.empMaritalStatus != null &&
            detailedEmployeeModel!.empMaritalStatus == 1
        ? LanguageConstants.married.tr
        : LanguageConstants.single.tr;
    mobileController.text = detailedEmployeeModel!.mobileNumber ?? "";
    landLineController.text = detailedEmployeeModel!.empWorkTelephone??"";
    emailController.text = detailedEmployeeModel!.empWorkEmail??"";
    nextToKinMobileController.text =
        detailedEmployeeModel!.next2KinMobNumber ?? "";
    nextToKinNameController.text = detailedEmployeeModel!.next2KinName ?? "";
    salaryController.text = detailedEmployeeModel!.salary?.toString() ?? "";
    paciController.text = detailedEmployeeModel!.empPaciNum.toString();
    otherIDController.text = detailedEmployeeModel!.empOtherId??"";
    // if (detailedEmployeeModel!.uploadBy != null &&
    //     detailedEmployeeModel!.uploadBy!.isNotEmpty &&
    //     detailedEmployeeModel!.uploadBy != "string") {
    //   pickedFile(XFile(detailedEmployeeModel!.uploadBy!));
    // }

    await getDepartment();
    await getOccupation();
  }


  TabController get tabController => _tabController;

  bool get isLoading => _isLoading.value;

  List<RefTableModel> get departmentList =>
      List<RefTableModel>.from(_departmentList);

  List<RefTableModel> get occupationList =>
      List<RefTableModel>.from(_occupationList);
}
