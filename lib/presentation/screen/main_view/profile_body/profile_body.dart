import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kupf/app_utility/app_color.dart';
import 'package:kupf/app_utility/common_function.dart';
import 'package:kupf/app_utility/image_string.dart';
import 'package:kupf/presentation/controller/profile/profile_body_controller.dart';
import 'package:kupf/presentation/models/ref_table_model.dart';
import 'package:kupf/widgets/k_textfield.dart';

import '../../../../languages/language_constants.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/loading.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

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
                  ListView(
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
                                  backgroundColor: mainColor.value.withOpacity(0.5),
                                  backgroundImage: controller.pickedFile.value == null
                                      ? const Image(
                                    image: ImageString.user,
                                    fit: BoxFit.cover,
                                  ).image
                                      : Image.file(File(controller.pickedFile.value!.path)).image,
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
                                        controller.pickedFile(await AppUtility.pickImage());
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                          controller: controller.employeeNameController,
                          hintText: LanguageConstants.userName.tr,
                          labelText: LanguageConstants.userName.tr),
                      AppUtility.heightBox,
                      LabelTextField(
                          controller: controller.arabicNameController,
                          hintText: LanguageConstants.arabicName.tr,
                          labelText: LanguageConstants.arabicName.tr),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.dobController,
                        hintText: LanguageConstants.dateOfBirth.tr,
                        labelText: LanguageConstants.dateOfBirth.tr,
                        readOnly: true,
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final date = await AppUtility.pickDate(context);
                              if (date != null) {
                                controller.dobController.text = DateFormat("yyyy-MM-dd").format(date);
                              }
                            },
                            icon: const Icon(Icons.calendar_today)),
                      ),
                      AppUtility.heightBox,
                      KDropDown(
                          value: controller.gender,
                          title: LanguageConstants.gender.tr,
                          dropdown: [LanguageConstants.male.tr, LanguageConstants.female.tr],
                          labelText: LanguageConstants.gender.tr),
                      AppUtility.heightBox,
                      KDropDown(
                          value: controller.marital,
                          title: LanguageConstants.maritalStatus.tr,
                          dropdown: [LanguageConstants.married.tr, LanguageConstants.single.tr],
                          labelText: LanguageConstants.maritalStatus.tr),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.mobileController,
                        labelText: LanguageConstants.mobile.tr,
                        hintText: LanguageConstants.mobile.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.landLineController,
                        labelText: LanguageConstants.landLine.tr,
                        hintText: LanguageConstants.landLine.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.emailController,
                        labelText: LanguageConstants.email.tr,
                        hintText: LanguageConstants.email.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.nextToKinNameController,
                        labelText: LanguageConstants.nextOfThekinName.tr,
                        hintText: LanguageConstants.nextOfThekinName.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.nextToKinMobileController,
                        labelText: LanguageConstants.nextOfThekinMobile.tr,
                        hintText: LanguageConstants.nextOfThekinMobile.tr,
                      ),
                      AppUtility.heightBox,
                    ],
                  ),

                  ///add job detail
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    children: [
                      AppUtility.heightBox,
                      AppUtility.heightBox,
                      Obx(() => DropdownButtonFormField<RefTableModel>(
                        value: controller.department.value,
                        //elevation: 16,
                        isExpanded: true,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          labelText: LanguageConstants.department.tr,
                        ),
                        onChanged: (RefTableModel? newValue) {
                          if (newValue != null) {
                            controller.department(newValue);
                          }
                        },
                        items: controller.departmentList.map<DropdownMenuItem<RefTableModel>>((RefTableModel value) {
                          return DropdownMenuItem<RefTableModel>(
                            value:  value,
                            child: Text(value.shortName ?? "No Name", style: const TextStyle(overflow: TextOverflow.ellipsis), overflow: TextOverflow.ellipsis, maxLines: 1,),
                          );
                        }).toList(),
                      )),
                      AppUtility.heightBox,

                      Obx(() => DropdownButtonFormField<RefTableModel>(
                        value: controller.occupation.value,
                        isExpanded: true,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          labelText: LanguageConstants.occupation.tr,
                        ),
                        //elevation: 16,
                        onChanged: (RefTableModel? newValue) {
                          if (newValue != null) {
                            controller.occupation(newValue);
                          }
                        },
                        items: controller.occupationList.map<DropdownMenuItem<RefTableModel>>((RefTableModel value) {
                          return DropdownMenuItem<RefTableModel>(
                            value:  value,
                            child: Text(value.shortName ?? "No Name", style: const TextStyle(overflow: TextOverflow.ellipsis), overflow: TextOverflow.ellipsis, maxLines: 1,),
                          );
                        }).toList(),
                      )),
                      AppUtility.heightBox,
                      LabelTextField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (salary) {
                          if (salary != null && salary.isNotEmpty && !GetUtils.isNumericOnly(salary)) {
                            return "Enter only number";
                          }
                          return null;
                        },
                        controller: controller.salaryController,
                        labelText: LanguageConstants.monthlySalary.tr,
                        hintText: LanguageConstants.monthlySalary.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.paciController,
                        labelText: LanguageConstants.PACI.tr,
                        hintText: LanguageConstants.PACI.tr,
                      ),
                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.otherIDController,
                        labelText: LanguageConstants.otherID.tr,
                        hintText: LanguageConstants.otherID.tr,
                      ),
                      AppUtility.heightBox,
                    ],
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
        if (controller.isLoading)
          const LoadingWidget(),
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

  const KDropDown(
      {Key? key, required this.title, required this.dropdown, this.labelText, this.onChange, required this.value,})
      : super(key: key);
  // String? value;


  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonFormField<String>(
      value: value.value,
      //elevation: 16,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        labelText: labelText,
      ),
      onChanged: onChange ?? (String? newValue) {

        value(newValue ?? 'Select');

      },
      items: dropdown.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),);
  }
}