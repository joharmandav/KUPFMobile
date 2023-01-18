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
      occupation.value = _occupationList.firstWhere((element) =>
          element.shortName == detailedEmployeeModel!.departmentName);
    }
  }

  Future<void> updateProfile() async {
    detailedEmployeeModel!.englishName = employeeNameController.text;
    detailedEmployeeModel!.arabicName = arabicNameController.text;
    detailedEmployeeModel!.employeeBirthday = dobController.text;
    detailedEmployeeModel!.employeeGender =
        gender.value != null && gender.value == LanguageConstants.male.tr
            ? 1
            : 0;
    detailedEmployeeModel!.maritalStatus =
        marital.value != null && marital.value == LanguageConstants.married.tr
            ? 1
            : 0;
    detailedEmployeeModel!.mobileNumber = mobileController.text;
    detailedEmployeeModel!.workTelephone = landLineController.text;
    detailedEmployeeModel!.workEmail = emailController.text;
    detailedEmployeeModel!.next2KinMobNumber = nextToKinMobileController.text;
    detailedEmployeeModel!.next2KinName = nextToKinNameController.text;
    detailedEmployeeModel!.salary = int.tryParse(salaryController.text) ?? 0;
    detailedEmployeeModel!.paciNumber = paciController.text;
    detailedEmployeeModel!.otherID = otherIDController.text;
    detailedEmployeeModel!.departmentName = occupation.value?.shortName ?? "";
    detailedEmployeeModel!.department = department.value?.refID ?? 0;
    detailedEmployeeModel!.uploadBy = pickedFile.value?.path ?? "";
    if (controller.status == 0) return;
    if (!await _connectivityService.checkConnectivity()) {
      ConnectivityService.internetErrorDialog();
      return;
    }

    _isLoading(true);

    dynamic response = await _apiProvider
        .updateEmployeeProfile(detailedEmployeeModel!.toJson());

    if (response == null) {
      _isLoading(false);
      return;
    }
    Toaster.showConfirm("Successfully Updated");
    await db.updateEmployeeDetails(detailedEmployeeModel!);
    _isLoading(false);
    controller.detailedEmployeeModel = detailedEmployeeModel!;
  }

  Future<void> init() async {
    if (!controller.checkStatus()) return;
    // String device = await controller.deviceID();
    _isLoading(true);
    if (await _connectivityService.checkConnectivity()) {
      try {
        detailedEmployeeModel =
            await _apiProvider.getEmployeeProfileById(controller.detailedEmployeeModel!.employeeID);
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
    dobController.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(detailedEmployeeModel?.employeeBirthday ?? ""));
    gender.value = detailedEmployeeModel!.employeeGender != null &&
            detailedEmployeeModel!.employeeGender == 1
        ? LanguageConstants.male.tr
        : LanguageConstants.female.tr;
    marital.value = detailedEmployeeModel!.maritalStatus != null &&
            detailedEmployeeModel!.maritalStatus == 1
        ? LanguageConstants.married.tr
        : LanguageConstants.single.tr;
    mobileController.text = detailedEmployeeModel!.mobileNumber ?? "";
    landLineController.text = detailedEmployeeModel!.workTelephone;
    emailController.text = detailedEmployeeModel!.workEmail;
    nextToKinMobileController.text =
        detailedEmployeeModel!.next2KinMobNumber ?? "";
    nextToKinNameController.text = detailedEmployeeModel!.next2KinName ?? "";
    salaryController.text = detailedEmployeeModel!.salary?.toString() ?? "";
    paciController.text = detailedEmployeeModel!.paciNumber.toString();
    otherIDController.text = detailedEmployeeModel!.otherID;
    if (detailedEmployeeModel!.uploadBy != null &&
        detailedEmployeeModel!.uploadBy!.isNotEmpty &&
        detailedEmployeeModel!.uploadBy != "string") {
      pickedFile(XFile(detailedEmployeeModel!.uploadBy!));
    }

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
