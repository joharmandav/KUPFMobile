import 'dart:io';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/common_function.dart';
import 'package:kupf_mobile/app_utility/image_string.dart';
import 'package:kupf_mobile/presentation/controller/profile/profile_body_controller.dart';
import 'package:kupf_mobile/presentation/models/ref_table_model.dart';
import 'package:kupf_mobile/widgets/k_textfield.dart';
// I/flutter (12822): Error fetching employee data: Exception: No employee data found

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
  var token = '';
  @override
  void initState() {
    super.initState();
    _apiProvider = ApiProvider();
    final controller = Get.find<GeneralController>();
    final token = controller.storageBox.read('token');
    final employeeId = controller.storageBox.read('employeeId');
    if (token != null) {
      print("token of the user is ${token}");
    } else {
      print("no token in the storage");
    }

    if (employeeId != null) {
      print('Stored Employee ID: $employeeId');
    } else {
      print('No Employee ID found in storage.');
    }

    _employeeProfileFuture = _apiProvider.getEmployeeProfile(employeeId);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileBodyController());
    return Obx(() => Stack(
          children: [
            Column(
              children: [
                TabBar(
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                      color: mainColor.value.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0)),
                  unselectedLabelColor: mainColor.value,
                  labelColor: AppColor.white,
                  tabs: [
                    Tab(
                      // icon: Icon(Icons.cloud_outlined),
                      text: LanguageConstants.addUser.tr,
                      //child: KText('Add User'),
                    ),
                    Tab(
                      // icon: Icon(Icons.cloud_outlined),
                      text: LanguageConstants.jobDetails.tr,
                      // child: KText(
                      //   'Job Details',
                      //   style: style.bodyText1!.copyWith(color: AppColor.black),
                      // ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      ///add user
                      FutureBuilder<LoginResModel?>(
                        future: _employeeProfileFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data == null) {
                            return const Center(child: Text('No data available'));
                          } else {
                            final employee = snapshot.data!;
                            return ListView(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              children: [
                                AppUtility.heightBox,
                                AppUtility.heightBox,
                                Align(
                                  child: SizedBox(
                                    height: 156.0,
                                    width: 156.0,
                                    child: Stack(
                                      children: [
                                        Obx(() => SizedBox.expand(
                                          child: CircleAvatar(
                                            backgroundColor:
                                            mainColor.value.withOpacity(0.5),
                                            backgroundImage: controller.pickedFile.value ==
                                                null
                                                ? const Image(
                                              image: ImageString.user,
                                              fit: BoxFit.cover,
                                            ).image
                                                : Image.file(File(
                                                controller.pickedFile.value!.path))
                                                .image,
                                          ),
                                        )),
                                        Align(
                                          alignment: const Alignment(1.25, -1.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(100.0)),
                                            color: mainColor.value,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: const Icon(Icons.edit),
                                                onPressed: () async {
                                                  controller
                                                      .pickedFile(await AppUtility.pickImage());
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.englishName,
                                  // controller: controller.employeeNameController,
                                  hintText: LanguageConstants.userName.tr,
                                  labelText: LanguageConstants.userName.tr,
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // controller: controller.arabicNameController,
                                  initialValue: employee.arabicName,
                                  hintText: LanguageConstants.arabicName.tr,
                                  labelText: LanguageConstants.arabicName.tr,
                                  prefixIcon: const Icon(Icons.person_2_sharp),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  // controller: controller.dobController,
                                  initialValue: employee.empBirthday,
                                  hintText: LanguageConstants.dateOfBirth.tr,
                                  labelText: LanguageConstants.dateOfBirth.tr,
                                  readOnly: true,
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        final date = await AppUtility.pickDate(context);
                                        if (date != null) {
                                          controller.dobController.text =
                                              DateFormat("yyyy-MM-dd").format(date);
                                        }
                                      },
                                      icon: const Icon(Icons.calendar_today)),
                                ),
                                AppUtility.heightBox,
                                KDropDown(
                                  value: RxnString(
                                    employee.empGender == '2'
                                        ? LanguageConstants.female.tr
                                        : LanguageConstants.male.tr,
                                  ), // Directly setting RxnString with the initial value
                                  title: LanguageConstants.gender.tr,
                                  dropdown: [
                                    LanguageConstants.male.tr,
                                    LanguageConstants.female.tr
                                  ],
                                  labelText: LanguageConstants.gender.tr,
                                  onChange: (String? newValue) {
                                    // Optionally handle changes
                                    print("Selected gender: $newValue");
                                  },
                                ),
                                AppUtility.heightBox,
                                KDropDown(
                                  value: RxnString(
                                    employee.empMaritalStatus == '1'
                                        ? LanguageConstants.married.tr
                                        : LanguageConstants.single.tr,
                                  ), // Directly setting RxnString with the initial value
                                  title: LanguageConstants.maritalStatus.tr,
                                  dropdown: [
                                    LanguageConstants.married.tr,
                                    LanguageConstants.single.tr
                                  ],
                                  labelText: LanguageConstants.maritalStatus.tr,
                                  onChange: (String? newValue) {
                                    // Optional logic for handling value change
                                    print("Selected marital status: $newValue");
                                  },
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.mobileNumber,
                                  // controller: controller.mobileController,
                                  labelText: LanguageConstants.mobile.tr,
                                  hintText: LanguageConstants.mobile.tr,
                                  prefixIcon: const Icon(Icons.phone),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.mobileNumber,
                                  // controller: controller.landLineController,
                                  labelText: LanguageConstants.landLine.tr,
                                  hintText: LanguageConstants.landLine.tr,
                                  prefixIcon: const Icon(Icons.phone_iphone),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.empWorkEmail,
                                  // controller: controller.emailController,
                                  labelText: LanguageConstants.email.tr,
                                  hintText: LanguageConstants.email.tr,
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                LabelTextField(
                                  initialValue: employee.empCidNum,
                                  // controller: controller.civilIdController,
                                  labelText: LanguageConstants.civilId.tr,
                                  hintText: LanguageConstants.civilId.tr,
                                  prefixIcon: const Icon(Icons.credit_card),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.next2KinName ?? "next2KinName",
                                  // controller: controller.nextToKinNameController,
                                  labelText: LanguageConstants.nextOfThekinName.tr,
                                  hintText: LanguageConstants.nextOfThekinName.tr,
                                  prefixIcon: const Icon(Icons.person_add),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.next2KinMobNumber ?? "next2KinMobNumber",
                                  // controller: controller.nextToKinMobileController,
                                  labelText: LanguageConstants.nextOfThekinMobile.tr,
                                  hintText: LanguageConstants.nextOfThekinMobile.tr,
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
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data == null) {
                            return const Center(child: Text('No data available'));
                          } else {
                            final employee = snapshot.data!;
                            return ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              children: [
                                AppUtility.heightBox,
                                AppUtility.heightBox,
                                // Obx(() => DropdownButtonFormField<RefTableModel>(
                                //       value: controller.department.value,
                                //
                                //       isExpanded: true,
                                //       decoration: InputDecoration(
                                //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                //         labelText: LanguageConstants.department.tr,
                                //       ),
                                //       onChanged: (RefTableModel? newValue) {
                                //         if (newValue != null) {
                                //           controller.department(newValue);
                                //         }
                                //       },
                                //       items: controller.departmentList
                                //           .map<DropdownMenuItem<RefTableModel>>(
                                //               (RefTableModel value) {
                                //         return DropdownMenuItem<RefTableModel>(
                                //           value: value,
                                //           child: Text(
                                //             value.shortname ?? "No Name",
                                //             style: const TextStyle(overflow: TextOverflow.ellipsis),
                                //             overflow: TextOverflow.ellipsis,
                                //             maxLines: 1,
                                //           ),
                                //         );
                                //       }).toList(),
                                //     )),
                                // AppUtility.heightBox,
                                // Obx(() => DropdownButtonFormField<RefTableModel>(
                                //       value: controller.department.value,
                                //       //elevation: 16,
                                //       isExpanded: true,
                                //       decoration: InputDecoration(
                                //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                //         labelText: LanguageConstants.department.tr,
                                //       ),
                                //       onChanged: (RefTableModel? newValue) {
                                //         if (newValue != null) {
                                //           controller.department(newValue);
                                //         }
                                //       },
                                //       items: controller.departmentList
                                //           .map<DropdownMenuItem<RefTableModel>>(
                                //               (RefTableModel value) {
                                //         return DropdownMenuItem<RefTableModel>(
                                //           value: value,
                                //           child: Text(
                                //             value.shortname ?? "No Name",
                                //             style: const TextStyle(overflow: TextOverflow.ellipsis),
                                //             overflow: TextOverflow.ellipsis,
                                //             maxLines: 1,
                                //           ),
                                //         );
                                //       }).toList(),
                                //     )),
                                // AppUtility.heightBox,
                                // Obx(() => DropdownButtonFormField<RefTableModel>(
                                //       value: controller.occupation.value,
                                //       isExpanded: true,
                                //       decoration: InputDecoration(
                                //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                //         labelText: LanguageConstants.occupation.tr,
                                //       ),
                                //       //elevation: 16,
                                //       onChanged: (RefTableModel? newValue) {
                                //         if (newValue != null) {
                                //           controller.occupation(newValue);
                                //         }
                                //       },
                                //       items: controller.occupationList
                                //           .map<DropdownMenuItem<RefTableModel>>(
                                //               (RefTableModel value) {
                                //         return DropdownMenuItem<RefTableModel>(
                                //           value: value,
                                //           child: Text(
                                //             value.shortname ?? "No Name",
                                //             style: const TextStyle(overflow: TextOverflow.ellipsis),
                                //             overflow: TextOverflow.ellipsis,
                                //             maxLines: 1,
                                //           ),
                                //         );
                                //       }).toList(),
                                //     )),
                                LabelTextField(
                                  initialValue: employee.department.toString(),
                                  // controller: controller.employeeNameController,
                                  hintText: "Enter the Department",
                                  labelText: "Department",
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox, LabelTextField(
                                  initialValue: employee.departmentName,
                                  // controller: controller.employeeNameController,
                                  hintText: "Enter the Department Name",
                                  labelText: "Department Name",
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: "Occupation null",
                                  // controller: controller.employeeNameController,
                                  hintText: "Enter the Occupation",
                                  labelText: "Occupation",
                                  prefixIcon: const Icon(Icons.person),
                                ),

                                AppUtility.heightBox,
                                LabelTextField(
                                  keyboardType: TextInputType.number,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (salary) {
                                    if (salary != null &&
                                        salary.isNotEmpty &&
                                        !GetUtils.isNumericOnly(salary)) {
                                      return "Enter only number";
                                    }
                                    return null;
                                  },
                                  // controller: controller.salaryController,
                                  initialValue: employee.salary.toString(),
                                  labelText: LanguageConstants.monthlySalary.tr,
                                  hintText: LanguageConstants.monthlySalary.tr,
                                  readOnly: true,
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: "PACI null",
                                  // controller: controller.paciController,
                                  labelText: LanguageConstants.PACI.tr,
                                  hintText: LanguageConstants.PACI.tr,
                                  readOnly: true,
                                ),
                                AppUtility.heightBox,
                                LabelTextField(
                                  initialValue: employee.empOtherId ?? "empOtherId null",
                                  // controller: controller.otherIDController,
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

class KDropDown extends StatelessWidget {
  final String title;
  final List<String> dropdown;
  final String? labelText;
  final RxnString value;
  final Function(String?)? onChange;

  const KDropDown({
    Key? key,
    required this.title,
    required this.dropdown,
    this.labelText,
    this.onChange,
    required this.value,
  }) : super(key: key);
  // String? value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        value: value.value,
        //elevation: 16,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          labelText: labelText,
        ),
        onChanged: onChange ??
            (String? newValue) {
              value(newValue ?? 'Select');
            },
        items: dropdown.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
