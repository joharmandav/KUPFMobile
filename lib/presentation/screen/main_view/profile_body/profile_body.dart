import 'dart:io';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/common_function.dart';
import 'package:kupf_mobile/presentation/controller/profile/profile_body_controller.dart';
import 'package:kupf_mobile/widgets/k_textfield.dart';
import 'package:kupf_mobile/widgets/kdropdown.dart';
import '../../../../app/server/api/api_provider.dart';
import '../../../../languages/language_constants.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/loading.dart';
import '../../../controller/main/general_controller.dart';
import '../../../models/login_response_model.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late Future<LoginResModel?> _employeeProfileFuture;
  GetStorage storageBox = GetStorage();
  late ApiProvider _apiProvider;
  final ProfileBodyController controller = Get.put(ProfileBodyController());

  @override
  void initState() {
    super.initState();
    // print("department list ${controller.departmentList}");
    // print("Occupation list ${controller.occupationList}");
    // print("department ${controller.occupation}");
    // print("Occupation ${controller.department}");
    _apiProvider = ApiProvider();
    final generalController = Get.find<GeneralController>();
    final employeeId = generalController.storageBox.read('employeeId');
    _employeeProfileFuture = _apiProvider.getEmployeeProfile(employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Column(
              children: [
                TabBar(
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    color: mainColor.value.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  unselectedLabelColor: mainColor.value,
                  labelColor: AppColor.white,
                  tabs: [
                    Tab(text: LanguageConstants.addUser.tr),
                    Tab(text: LanguageConstants.jobDetails.tr),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      FutureBuilder<LoginResModel?>(
                        future: _employeeProfileFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return const Center(
                                child: Text('No data available'));
                          } else {
                            final employee = snapshot.data!;

                            return ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              children: [
                                AppUtility.heightBox,
                                AppUtility.heightBox,
                                Column(
                                  children: [
                                    Obx(() {
                                      return CircleAvatar(
                                        radius: 60,
                                        backgroundImage: controller
                                                .imageUrl.isEmpty
                                            ? const AssetImage(
                                                'assets/default_profile.png') // Default image
                                            : FileImage(File(
                                                    controller.imageUrl.value))
                                                as ImageProvider,
                                      );
                                    }),
                                    const SizedBox(height: 20),
                                    ElevatedButton.icon(
                                      onPressed: () => controller
                                          .pickImage(ImageSource.gallery),
                                      icon: const Icon(Icons.photo),
                                      label: const Text(
                                          'Select Image from Gallery'),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () => controller
                                          .pickImage(ImageSource.camera),
                                      icon: const Icon(Icons.camera),
                                      label: const Text(
                                          'Capture Image from Camera'),
                                    ),
                                  ],
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.employeeNameController,
                                  hintText: LanguageConstants.userName.tr,
                                  labelText: LanguageConstants.userName.tr,
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.arabicNameController,
                                  hintText: LanguageConstants.arabicName.tr,
                                  labelText: LanguageConstants.arabicName.tr,
                                  prefixIcon: const Icon(Icons.person_2_sharp),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.dobController,
                                  hintText: LanguageConstants.dateOfBirth.tr,
                                  labelText: LanguageConstants.dateOfBirth.tr,
                                  readOnly: true,
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      final date =
                                          await AppUtility.pickDate(context);
                                      if (date != null) {
                                        controller.dobController.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(date);
                                      }
                                    },
                                    icon: const Icon(Icons.calendar_today),
                                  ),
                                ),
                                AppUtility.heightBox,
                                KDropDown(
                                  value: controller.gender,
                                  title: LanguageConstants.gender.tr,
                                  dropdown: [
                                    LanguageConstants.male.tr,
                                    LanguageConstants.female.tr
                                  ],
                                  labelText: LanguageConstants.gender.tr,
                                  onChange: (String? newValue) {
                                    controller.gender(newValue);
                                  },
                                ),
                                AppUtility.heightBox,
                                KDropDown(
                                  value: controller.marital,
                                  title: LanguageConstants.maritalStatus.tr,
                                  dropdown: [
                                    LanguageConstants.married.tr,
                                    LanguageConstants.single.tr
                                  ],
                                  labelText: LanguageConstants.maritalStatus.tr,
                                  onChange: (String? newValue) {
                                    controller.maritalStatusController;
                                  },
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.mobileController,
                                  labelText: LanguageConstants.mobile.tr,
                                  hintText: LanguageConstants.mobile.tr,
                                  prefixIcon: const Icon(Icons.phone),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.landLineController,
                                  labelText: LanguageConstants.landLine.tr,
                                  hintText: LanguageConstants.landLine.tr,
                                  prefixIcon: const Icon(Icons.phone_iphone),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller: controller.emailController,
                                  labelText: LanguageConstants.email.tr,
                                  hintText: LanguageConstants.email.tr,
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                LabelTextField(
                                  controller: controller.civilIdController,
                                  labelText: LanguageConstants.civilId.tr,
                                  hintText: LanguageConstants.civilId.tr,
                                  prefixIcon: const Icon(Icons.credit_card),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller:
                                      controller.nextToKinNameController,
                                  labelText:
                                      LanguageConstants.nextOfThekinName.tr,
                                  hintText:
                                      LanguageConstants.nextOfThekinName.tr,
                                  prefixIcon: const Icon(Icons.person_add),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  controller:
                                      controller.nextToKinMobileController,
                                  labelText:
                                      LanguageConstants.nextOfThekinMobile.tr,
                                  hintText:
                                      LanguageConstants.nextOfThekinMobile.tr,
                                  prefixIcon: const Icon(Icons.phone),
                                ),
                                AppUtility.heightBox,
                              ],
                            );
                          }
                        },
                      ),
                      FutureBuilder<LoginResModel?>(
                        future: _employeeProfileFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return const Center(
                                child: Text('No data available'));
                          } else {
                            final employee = snapshot.data!;
                            return ListView(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              children: [
                                AppUtility.heightBox,
                                AppUtility.heightBox,
                                LabelTextField(
                                  // initialValue: employee.department.toString(),
                                  controller: controller.employeeNameController,
                                  hintText: "Enter the Department",
                                  labelText: "Department",
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // initialValue: employee.departmentName,
                                  // controller: controller.employeeNameController,
                                  hintText: "Enter the Department Name",
                                  labelText: "Department Name",
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // initialValue: "Occupation null",
                                  controller: controller.departmentController,
                                  hintText: "Enter the Occupation",
                                  labelText: "Occupation",
                                  prefixIcon: Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (salary) {
                                    if (salary != null &&
                                        salary.isNotEmpty &&
                                        !GetUtils.isNumericOnly(salary)) {
                                      return "Enter only number";
                                    }
                                    return null;
                                  },
                                  controller: controller.salaryController,
                                  // initialValue: employee.salary.toString(),
                                  labelText: LanguageConstants.monthlySalary.tr,
                                  hintText: LanguageConstants.monthlySalary.tr,
                                  readOnly: true,
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // initialValue: "PACI null",
                                  controller: controller.paciController,
                                  labelText: LanguageConstants.PACI.tr,
                                  hintText: LanguageConstants.PACI.tr,
                                  readOnly: true,
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // initialValue:  employee.empOtherId ?? "empOtherId null",
                                  controller: controller.otherIDController,
                                  labelText: LanguageConstants.otherID.tr,
                                  hintText: LanguageConstants.otherID.tr,
                                  readOnly: true,
                                ),
                                AppUtility.heightBox,
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                AppUtility.heightBoxMin,
                AppButtonElevated(
                  text: LanguageConstants.update.tr,
                  onPressed: controller.updateProfile,
                ),
                AppUtility.heightBox,
              ],
            ),
            if (controller.isLoading) const LoadingWidget(),
          ],
        ));
  }
}
