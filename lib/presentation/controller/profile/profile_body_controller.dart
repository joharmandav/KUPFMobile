import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kupf_mobile/app/server/api/api_provider.dart';
import 'package:kupf_mobile/app/server/database/database_helper.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:kupf_mobile/presentation/models/detailed_employee_model.dart';
import 'package:kupf_mobile/presentation/models/ref_table_model.dart';
import '../../../helper/toaster.dart';
import '../../../languages/language_constants.dart';
import '../../models/login_response_model.dart';
import '../connectivity_controller.dart';
import 'dart:io';

class ProfileBodyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _apiProvider = Get.find<ApiProvider>();
  final DatabaseHelper nDb = DatabaseHelper();
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
  final TextEditingController civilIdController = TextEditingController();
  final TextEditingController landLineController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nextToKinMobileController =
      TextEditingController();
  final TextEditingController nextToKinNameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController paciController = TextEditingController();
  final TextEditingController otherIDController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController departmentNameController =
      TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  int tenantID = 21;
  String RejectedDate = "2024-09-12T12:34:56";
  DetailedEmployeeModel? employeeViewModel;
  RxnString gender = RxnString();
  RxnString marital = RxnString();
  Rxn<RefTableModel> department = Rxn<RefTableModel>();
  Rxn<RefTableModel> occupation = Rxn<RefTableModel>();

  final RxList<RefTableModel> _departmentList = RxList<RefTableModel>();

  final RxList<RefTableModel> _occupationList = RxList<RefTableModel>();

  Rxn<LoginResModel> employee = Rxn<LoginResModel>();
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString imageUrl = ''.obs; // Holds the image URL (for display purposes)
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      // Generate a local URL for now (if needed)
      imageUrl.value = pickedFile.path;
      update();
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (controller.isVisible.value == false) {
      employeeNameController.text = "Guestofer Mill Gen";
      mobileController.text = "11111111";
    }
    _tabController = TabController(length: 2, vsync: this);
    _connectivityService.initConnectivity();
    init();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  Future<void> getDetailedEmployeeProfile() async {
    final controller = Get.find<GeneralController>();
    final employeeId = controller.storageBox.read('employeeId');

    try {
      _isLoading(true);

      LoginResModel? emprofileDetails =
          await _apiProvider.getEmployeeProfile(employeeId);

      employee.value = emprofileDetails;
      print("EMPLOYEE VALUE =>>>>> ${employee.value}");

      if (employee.value != null) {
        employeeNameController.text = employee.value!.englishName!;
        arabicNameController.text = employee.value!.arabicName!;
        dobController.text = employee.value!.empBirthday!;
        genderController.text = (employee.value!.empGender != null &&
                    employee.value!.empGender == LanguageConstants.male.tr
                ? 1
                : 0)
            .toString();
        maritalStatusController.text =
            (employee.value!.empMaritalStatus != null &&
                        employee.value!.empMaritalStatus ==
                            LanguageConstants.married.tr
                    ? 1
                    : 0)
                .toString();
        mobileController.text = employee.value!.mobileNumber!;
        emailController.text = employee.value!.empWorkEmail!;
        nextToKinNameController.text = employee.value!.next2KinName!;
        nextToKinMobileController.text = employee.value!.next2KinMobNumber!;
        civilIdController.text = employee.value!.empCidNum!;
      } else {
        throw Exception("Employee data is null after fetching");
      }
    } catch (e) {
      print("Error fetching employee data: $e");
    } finally {
      _isLoading(false);
    }
  }

  Future<void> updateProfile() async {
    employee.value?.englishName = employeeNameController.text;
    employee.value?.arabicName = arabicNameController.text;
    employee.value?.empBirthday = dobController.text;
    employee.value?.empGender = int.parse(genderController.text.toString());
    employee.value?.empMaritalStatus = maritalStatusController.text.toString();
    employee.value?.mobileNumber = mobileController.text;
    employee.value?.next2KinMobNumber = nextToKinMobileController.text;
    employee.value?.next2KinName = nextToKinNameController.text;
    employee.value?.empPaciNum = civilIdController.text;


    // employee.value?. = landLineController.text;
    employee.value?.department = int.parse(departmentController.text);
    employee.value?.departmentName = int.parse(departmentNameController.text);


    _isLoading(true);

    // Prepare payload
    Map<String, dynamic> payload = employee.value!.toMap();

    // Check for fields that were not updated (i.e., remain null or default)
    Map<String, dynamic> unsentFields = {};
    employee.value!.toMap().forEach((key, value) {
      if (value == null || value == '') {
        unsentFields[key] = value;
      }
    });

    // Print unsent fields
    print("Fields not being sent (null or empty): $unsentFields");

    // Make the API request
    dynamic response = await _apiProvider.updateEmployeeProfile(payload);

    if (response == null) {
      _isLoading(false);
      return;
    }

    Toaster.showConfirm("Successfully Updated");

    _isLoading(false);
  }

  Future<void> init() async {
    _isLoading(true);

    await getDetailedEmployeeProfile();
  }

  TabController get tabController => _tabController;

  bool get isLoading => _isLoading.value;

  List<RefTableModel> get departmentList =>
      List<RefTableModel>.from(_departmentList);

  List<RefTableModel> get occupationList =>
      List<RefTableModel>.from(_occupationList);
}
