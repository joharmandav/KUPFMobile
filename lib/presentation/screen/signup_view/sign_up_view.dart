// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kupf_mobile/app_utility/app_text_theme.dart';
// import 'package:kupf_mobile/app_utility/common_function.dart';
// import 'package:kupf_mobile/app_utility/image_string.dart';
// import 'package:kupf_mobile/widgets/button_widget.dart';
// import 'package:kupf_mobile/widgets/curve_box_decoration.dart';
// import 'package:kupf_mobile/widgets/k_textfield.dart';
//
// import '../../../languages/language_constants.dart';
//
// class SignUpController extends GetxController {
//   var isPasswordVisible = false.obs; // Reactive variable for password visibility
// }
//
// class SignUpView extends StatelessWidget {
//   const SignUpView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.blueAccent,
//           title: Text(
//             LanguageConstants.signUp.tr,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Zillaslab',
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size(0, 50),
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 12, left: 24),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   LanguageConstants.signInAppBarSubtitle.tr,
//                   style: AppTextTheme.bodyText1white.copyWith(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: CurvedBoxDecoration(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: ListView(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 24),
//                   child: Image(
//                     image: ImageString.logo,
//                     height: 100,
//                   ),
//                 ),
//                 AppUtility.heightBox,
//                 // Full Name Field
//                 LabelTextField(
//                   labelText: LanguageConstants.fullName.tr,
//                   hintText: LanguageConstants.fullName.tr,
//                   keyboardType: TextInputType.text,
//                   prefixIcon: const Icon(Icons.person),
//                 ),
//                 AppUtility.heightBox,
//                 // Department Field
//                 LabelTextField(
//                   labelText: LanguageConstants.departmentWorking.tr,
//                   hintText: LanguageConstants.department.tr,
//                   keyboardType: TextInputType.text,
//                   prefixIcon: const Icon(Icons.business),
//                 ),
//                 AppUtility.heightBox,
//                 // Kuwait University ID Field
//                 LabelTextField(
//                   labelText: LanguageConstants.kuwaitUniversityId.tr,
//                   hintText: LanguageConstants.kuwaitUniversityId.tr,
//                   keyboardType: TextInputType.number,
//                   prefixIcon: const Icon(Icons.card_membership),
//                 ),
//                 AppUtility.heightBox,
//                 // Civil ID Field
//                 LabelTextField(
//                   labelText: LanguageConstants.civilID.tr,
//                   hintText: LanguageConstants.civilID.tr,
//                   keyboardType: TextInputType.number,
//                   prefixIcon: const Icon(Icons.credit_card),
//                 ),
//                 AppUtility.heightBox,
//                 // Position Field
//                 LabelTextField(
//                   labelText: LanguageConstants.positionHeIsOn.tr,
//                   hintText: LanguageConstants.positionHeIsOn.tr,
//                   keyboardType: TextInputType.text,
//                   prefixIcon: const Icon(Icons.work),
//                 ),
//                 AppUtility.heightBox,
//                 // User ID Field
//                 LabelTextField(
//                   labelText: LanguageConstants.userId.tr,
//                   hintText: LanguageConstants.userId.tr,
//                   keyboardType: TextInputType.text,
//                   prefixIcon: const Icon(Icons.person_outline),
//                 ),
//                 AppUtility.heightBox,
//                 // Password Field
//                 Obx(
//                       () => LabelTextField(
//                     labelText: LanguageConstants.password.tr,
//                     hintText: LanguageConstants.password.tr,
//                     obscureText: !controller.isPasswordVisible.value, // Toggle visibility
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.isPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         controller.isPasswordVisible.toggle(); // Toggle visibility
//                       },
//                     ),
//                   ),
//                 ),
//                 AppUtility.heightBox,
//                 AppButtonElevated(
//                   text: LanguageConstants.register.tr,
//                   onPressed: () {
//
//                   },
//                   primaryColor: Colors.blueAccent,
//                   width: double.infinity,
//                 ),
//                 AppUtility.heightBox,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
