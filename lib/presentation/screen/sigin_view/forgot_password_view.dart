import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/login/forgot_password_dialog_controller.dart';
import 'package:kupf_mobile/presentation/screen/sigin_view/otp_verification.dart';

import '../../../app_utility/app_text_theme.dart';
import '../../../app_utility/common_function.dart';
import '../../../app_utility/image_string.dart';
import '../../../languages/language_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/curve_box_decoration.dart';
import '../../../widgets/k_textfield.dart';
import '../../../widgets/loading.dart';

class ForgotPasswordView extends GetView<ForgotPasswordDialogController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(LanguageConstants.forgotPassword.tr.replaceAll("?", "")),
          bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.forgotPasswordAppBarSubtitle.tr,
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
                      if(controller.isPhone.value)
                      LabelTextField(
                        // labelText: AppString.phoneNumber,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LanguageConstants.required.tr;
                            }
                            return null;
                          },
                          hintText: '3180235478',
                          keyboardType: TextInputType.number,
                          prefixIcon: CountryCodePicker(
                            padding: EdgeInsets.zero,
                            onInit: (value) {
                              if (value!.code != null && value.code!.isNotEmpty) {
                                controller.countryCode(value.dialCode);
                              }
                            },
                            onChanged: (value) {
                              if (value.code != null && value.code!.isNotEmpty) {
                                controller.countryCode(value.dialCode);
                              }
                            },
                            initialSelection: 'KW',
                            showFlag: true,
                            showDropDownButton: true,
                            alignLeft: false,
                          )),
                      if (!controller.isPhone.value)
                        Column(
                          children: [
                            AppUtility.heightBox,
                            LabelTextField(
                              // labelText: AppString.phoneNumber,
                              controller: controller.emailController,
                              hintText: LanguageConstants.email.tr,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LanguageConstants.emailRequired.tr;
                                } else if (!GetUtils.isEmail(value)) {
                                  return LanguageConstants.invalidEmail.tr;
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.email_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      AppUtility.heightBox,
                      AppUtility.heightBox,
                      AppButtonElevated(
                        text: LanguageConstants.submit.tr,
                        onPressed: () {
                          // controller.signIn();
                          Get.off(() => const OTPVerification());
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
