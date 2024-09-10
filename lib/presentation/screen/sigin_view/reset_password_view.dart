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
import '../../controller/login/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // added beacuse of binding innitailization
      final _controller = Get.put(
      ResetPasswordController(),
    );
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(LanguageConstants.resetPassword.tr),
          bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.resetPasswordAppBarSubtitle.tr,
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
                      LabelTextField(
                        controller: controller.newPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: controller.newObscureText.value,
                        labelText: LanguageConstants.newPassword.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LanguageConstants.required.tr;
                          } else if (value.length <= 7) {
                            return LanguageConstants.maxLength.tr;
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            icon: controller.newObscureText.value
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              controller.newObscureText.value =
                              !controller.newObscureText.value;
                            }),
                      ),

                      AppUtility.heightBox,
                      LabelTextField(
                        controller: controller.currentPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: controller.currentObscureText.value,
                        labelText: LanguageConstants.confirmPassword.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LanguageConstants.required.tr;
                          } else if (value.length <= 7) {
                            return LanguageConstants.maxLength.tr;
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                            icon: controller.currentObscureText.value
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              controller.currentObscureText.value =
                              !controller.currentObscureText.value;
                            }),
                      ),
                      AppUtility.heightBox,
                      AppUtility.heightBox,
                      AppButtonElevated(
                        text: LanguageConstants.reset.tr,
                        onPressed: () {
                          // controller.signIn();
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
