// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
// import 'package:kupf_mobile/app/server/api/api_provider.dart';
// import 'package:kupf_mobile/app_utility/app_color.dart';
// import 'package:kupf_mobile/app_utility/common_function.dart';
// import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
// import 'package:kupf_mobile/presentation/controller/profile/profile_body_controller.dart';
// import 'package:kupf_mobile/presentation/models/login_response_model.dart';
// import 'package:kupf_mobile/presentation/models/ref_table_model.dart';
// import 'package:kupf_mobile/presentation/screen/main_view/profile_body/profile_body.dart';
// import 'package:kupf_mobile/widgets/k_textfield.dart';
//
// import 'app_utility/image_string.dart';
// import 'languages/language_constants.dart';
//
// class EmployeeProfileScreen extends StatefulWidget {
//   const EmployeeProfileScreen({super.key});
//
//   @override
//   _EmployeeProfileScreenState createState() => _EmployeeProfileScreenState();
// }
//
// class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
//   late Future<LoginResModel?> _employeeProfileFuture;
//   GetStorage storageBox = GetStorage();
//   late ApiProvider _apiProvider;
//   var token = '';
//   @override
//   void initState() {
//     super.initState();
//     _apiProvider = ApiProvider();
//     final controller = Get.find<GeneralController>();
//     final token = controller.storageBox.read('token');
//     final employeeId = controller.storageBox.read('employeeId');
//     if (token != null) {
//       print("token of the user is ${token}");
//     } else {
//       print("no token in the storage");
//     }
//
//     if (employeeId != null) {
//       print('Stored Employee ID: $employeeId');
//     } else {
//       print('No Employee ID found in storage.');
//     }
//
//     _employeeProfileFuture = _apiProvider.getEmployeeProfile(employeeId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileBodyController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employee Profile'),
//       ),
//       body: FutureBuilder<LoginResModel?>(
//         future: _employeeProfileFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return const Center(child: Text('No data available'));
//           } else {
//             final employee = snapshot.data!;
//             return ListView(
//               shrinkWrap: true,
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               children: [
//                 AppUtility.heightBox,
//                 AppUtility.heightBox,
//                 // Obx(() => DropdownButtonFormField<RefTableModel>(
//                 //       value: controller.department.value,
//                 //
//                 //       isExpanded: true,
//                 //       decoration: InputDecoration(
//                 //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                 //         labelText: LanguageConstants.department.tr,
//                 //       ),
//                 //       onChanged: (RefTableModel? newValue) {
//                 //         if (newValue != null) {
//                 //           controller.department(newValue);
//                 //         }
//                 //       },
//                 //       items: controller.departmentList
//                 //           .map<DropdownMenuItem<RefTableModel>>(
//                 //               (RefTableModel value) {
//                 //         return DropdownMenuItem<RefTableModel>(
//                 //           value: value,
//                 //           child: Text(
//                 //             value.shortname ?? "No Name",
//                 //             style: const TextStyle(overflow: TextOverflow.ellipsis),
//                 //             overflow: TextOverflow.ellipsis,
//                 //             maxLines: 1,
//                 //           ),
//                 //         );
//                 //       }).toList(),
//                 //     )),
//                 // AppUtility.heightBox,
//                 // Obx(() => DropdownButtonFormField<RefTableModel>(
//                 //       value: controller.department.value,
//                 //       //elevation: 16,
//                 //       isExpanded: true,
//                 //       decoration: InputDecoration(
//                 //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                 //         labelText: LanguageConstants.department.tr,
//                 //       ),
//                 //       onChanged: (RefTableModel? newValue) {
//                 //         if (newValue != null) {
//                 //           controller.department(newValue);
//                 //         }
//                 //       },
//                 //       items: controller.departmentList
//                 //           .map<DropdownMenuItem<RefTableModel>>(
//                 //               (RefTableModel value) {
//                 //         return DropdownMenuItem<RefTableModel>(
//                 //           value: value,
//                 //           child: Text(
//                 //             value.shortname ?? "No Name",
//                 //             style: const TextStyle(overflow: TextOverflow.ellipsis),
//                 //             overflow: TextOverflow.ellipsis,
//                 //             maxLines: 1,
//                 //           ),
//                 //         );
//                 //       }).toList(),
//                 //     )),
//                 // AppUtility.heightBox,
//                 // Obx(() => DropdownButtonFormField<RefTableModel>(
//                 //       value: controller.occupation.value,
//                 //       isExpanded: true,
//                 //       decoration: InputDecoration(
//                 //         // contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                 //         labelText: LanguageConstants.occupation.tr,
//                 //       ),
//                 //       //elevation: 16,
//                 //       onChanged: (RefTableModel? newValue) {
//                 //         if (newValue != null) {
//                 //           controller.occupation(newValue);
//                 //         }
//                 //       },
//                 //       items: controller.occupationList
//                 //           .map<DropdownMenuItem<RefTableModel>>(
//                 //               (RefTableModel value) {
//                 //         return DropdownMenuItem<RefTableModel>(
//                 //           value: value,
//                 //           child: Text(
//                 //             value.shortname ?? "No Name",
//                 //             style: const TextStyle(overflow: TextOverflow.ellipsis),
//                 //             overflow: TextOverflow.ellipsis,
//                 //             maxLines: 1,
//                 //           ),
//                 //         );
//                 //       }).toList(),
//                 //     )),
//                 LabelTextField(
//                   initialValue: employee.department.toString(),
//                   // controller: controller.employeeNameController,
//                   hintText: "Enter the Department",
//                   labelText: "Department",
//                   prefixIcon: const Icon(Icons.person),
//                 ),
//                 AppUtility.heightBox, LabelTextField(
//                   initialValue: employee.departmentName,
//                   // controller: controller.employeeNameController,
//                   hintText: "Enter the Department Name",
//                   labelText: "Department Name",
//                   prefixIcon: const Icon(Icons.person),
//                 ),
//                 AppUtility.heightBox,
//                 LabelTextField(
//                   initialValue: "Occupation null",
//                   // controller: controller.employeeNameController,
//                   hintText: "Enter the Occupation",
//                   labelText: "Occupation",
//                   prefixIcon: const Icon(Icons.person),
//                 ),
//
//                 AppUtility.heightBox,
//                 LabelTextField(
//                   keyboardType: TextInputType.number,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (salary) {
//                     if (salary != null &&
//                         salary.isNotEmpty &&
//                         !GetUtils.isNumericOnly(salary)) {
//                       return "Enter only number";
//                     }
//                     return null;
//                   },
//                   // controller: controller.salaryController,
//                   initialValue: employee.salary.toString(),
//                   labelText: LanguageConstants.monthlySalary.tr,
//                   hintText: LanguageConstants.monthlySalary.tr,
//                   readOnly: true,
//                 ),
//                 AppUtility.heightBox,
//                 LabelTextField(
//                   initialValue: "PACI null",
//                   // controller: controller.paciController,
//                   labelText: LanguageConstants.PACI.tr,
//                   hintText: LanguageConstants.PACI.tr,
//                   readOnly: true,
//                 ),
//                 AppUtility.heightBox,
//                 LabelTextField(
//                   initialValue: employee.empOtherId ?? "empOtherId null",
//                   controller: controller.otherIDController,
//                   labelText: LanguageConstants.otherID.tr,
//                   hintText: LanguageConstants.otherID.tr,
//                   readOnly: true,
//                 ),
//                 AppUtility.heightBox,
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
