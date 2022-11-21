import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kupf/app/server/database/kupf_database.dart';
import 'package:kupf/presentation/controller/main/general_controller.dart';
import 'package:kupf/presentation/models/detailed_employee_model.dart';
import 'package:kupf/presentation/models/ref_table_model.dart';

import '../../../languages/language_constants.dart';

class ProfileBodyController extends GetxController {

  final DbManager db = DbManager();
  final controller = Get.find<GeneralController>();
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController arabicNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController landLineController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nextToKinMobileController = TextEditingController();
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
    init();
    getDepartment();
    getOccupation();
  }

  Future<void> getDepartment() async {
    final departmentResult = await db.getDepartments();
    if (departmentResult.isEmpty) return;
    Get.log(departmentResult.length.toString());
    _departmentList.assignAll(departmentResult);
    department.value = _departmentList.firstWhere((element) => element.shortName == detailedEmployeeModel!.departmentName);
  }

  Future<void> getOccupation() async {
    final occupation = await db.getOccupation();
    if (occupation.isEmpty) return;
      Get.log(occupation.length.toString());
    _occupationList.assignAll(occupation);
  }

  Future<void> updateProfile() async {
    detailedEmployeeModel!.englishName = employeeNameController.text;
    detailedEmployeeModel!.arabicName = arabicNameController.text;
    detailedEmployeeModel!.employeeBirthday = dobController.text;
    detailedEmployeeModel!.employeeGender = gender.value != null && gender.value == LanguageConstants.male.tr ? 1 : 0;
    detailedEmployeeModel!.maritalStatus = marital.value != null && marital.value == LanguageConstants.married.tr ? 1 : 0;
    detailedEmployeeModel!.mobileNumber = mobileController.text;
    detailedEmployeeModel!.workEmail = emailController.text;
    detailedEmployeeModel!.next2KinMobNumber = nextToKinMobileController.text;
    detailedEmployeeModel!.next2KinName = nextToKinNameController.text;
    detailedEmployeeModel!.salary = int.tryParse(salaryController.text) ?? 0;
    detailedEmployeeModel!.paciNumber = paciController.text;
    detailedEmployeeModel!.otherID = otherIDController.text;
    detailedEmployeeModel!.departmentName = department.value!.shortName;
    await db.updateEmployeeDetails(detailedEmployeeModel!);
    controller.detailedEmployeeModel = detailedEmployeeModel!;
  }

  Future<void> init() async {
    if (controller.status == 0) return;
    detailedEmployeeModel = await db.getLogin(controller.storageBox.read("email") ?? controller.storageBox.read("phone"), controller.storageBox.read("password"), controller.storageBox.read("device"));
    if (detailedEmployeeModel == null) {
      controller.storageBox.write("status", 0);
      return;
    }

    controller.detailedEmployeeModel = detailedEmployeeModel!;
    employeeNameController.text = detailedEmployeeModel!.englishName!;
    arabicNameController.text = detailedEmployeeModel!.arabicName!;
    dobController.text = detailedEmployeeModel!.employeeBirthday ?? "";
    gender.value = detailedEmployeeModel!.employeeGender != null && detailedEmployeeModel!.employeeGender == 1 ? LanguageConstants.male.tr : LanguageConstants.female.tr;
    marital.value = detailedEmployeeModel!.maritalStatus != null && detailedEmployeeModel!.maritalStatus == 1 ? LanguageConstants.married.tr : LanguageConstants.single.tr;
    mobileController.text = detailedEmployeeModel!.mobileNumber ?? "";
    emailController.text = detailedEmployeeModel!.workEmail;
    nextToKinMobileController.text = detailedEmployeeModel!.next2KinMobNumber ?? "";
    nextToKinNameController.text = detailedEmployeeModel!.next2KinName ?? "";
    salaryController.text = detailedEmployeeModel!.salary?.toString() ?? "";
    paciController.text = detailedEmployeeModel!.paciNumber.toString();
    otherIDController.text = detailedEmployeeModel!.otherID;
  }

  List<RefTableModel> get departmentList => List<RefTableModel>.from(_departmentList);

  List<RefTableModel> get occupationList => List<RefTableModel>.from(_occupationList);
}