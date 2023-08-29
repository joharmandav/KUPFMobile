// import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_utility/app_text_theme.dart';
import '../../../app_utility/common_function.dart';
import '../../../app_utility/image_string.dart';
import '../../../languages/language_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/curve_box_decoration.dart';
import '../../../widgets/k_textfield.dart';
import '../../../widgets/loading.dart';
import '../../controller/login/signin_with_mobile_controller.dart';

class SignInWithMobileView extends StatelessWidget {
  const SignInWithMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInWithMobileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(LanguageConstants.signIn.tr),
          bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.signInAppBarSubtitle.tr,
                  style: AppTextTheme.bodyText1white,
                ),
              ),
            ),
          ),
        ),
        body: Obx(
              () => Stack(
            children: [
              CurvedBoxDecoration(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Image(image: ImageString.logo),
                      ),
                      AppUtility.heightBox,
                      IntlPhoneField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: controller.otpSent.value,
                        onChanged: (value) {

                        },
                        onCountryChanged: (value) {
                          controller.countryCode(value.dialCode);
                        },
                        controller: controller.phoneController,
                        initialCountryCode: 'KW',
                        // keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.completeNumber.isEmpty) {
                            return LanguageConstants.required.tr;
                          }
                          return null;
                        },
                      ),
                      // LabelTextField(
                      //   // labelText: AppString.phoneNumber,
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return LanguageConstants.required.tr;
                      //     }
                      //     return null;
                      //   },
                      //   readOnly: controller.otpSent.value,
                      //     hintText: '3180235478',
                      //     keyboardType: TextInputType.number,
                      //     prefixIcon: CountryCodePicker(
                      //       padding: EdgeInsets.zero,
                      //       onInit: (value) {
                      //         if (value!.code != null && value.code!.isNotEmpty) {
                      //           controller.countryCode(value.dialCode);
                      //         }
                      //       },
                      //       onChanged: (value) {
                      //         if (value.code != null && value.code!.isNotEmpty) {
                      //           controller.countryCode(value.dialCode);
                      //         }
                      //       },
                      //       initialSelection: 'KW',
                      //       showFlag: true,
                      //       showDropDownButton: true,
                      //       alignLeft: false,
                      //     )),
                      if (controller.otpSent.value)
                        Column(
                          children: [
                            AppUtility.heightBox,
                            LabelTextField(
                              controller: controller.otpController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              labelText: LanguageConstants.password.tr,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LanguageConstants.required.tr;
                                } else if (controller.otpSent.value && value != controller.sourceCode.value) {
                                  return LanguageConstants.invalidOtp.tr;
                                }
                                return null;
                              },
                              //   suffixIcon: IconButton(
                              //       icon: controller.obscureText.value
                              //           ? const Icon(Icons.remove_red_eye_outlined)
                              //           : const Icon(Icons.remove_red_eye),
                              //       onPressed: () {
                              //         controller.obscureText.value =
                              //         !controller.obscureText.value;
                              //       }),
                            ),
                            AppUtility.heightBox,
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: LanguageConstants.dontReceive.tr,
                                style: Get.theme.textTheme.titleSmall!.copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text: controller.isActive
                                        ? ' ${controller.countDown} s'
                                        : " ${LanguageConstants.resend.tr}",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => controller.reSend(),
                                    style: Get.theme.textTheme.titleSmall!.copyWith(
                                      color: controller.isActive
                                          ? Colors.black54
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      AppUtility.heightBox,
                      AppUtility.heightBox,
                      AppButtonElevated(
                        text: LanguageConstants.signIn.tr,
                        onPressed: () {
                          controller.signIn();
                        },
                      ),
                      AppUtility.height32Box,
                      // social signin
                    ],
                  ),
                ),
              ),
              if (controller.isLoading.value) const LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
