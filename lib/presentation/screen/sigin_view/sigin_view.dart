import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kupf/app_utility/app_color.dart';
import 'package:kupf/app_utility/app_text_theme.dart';
import 'package:kupf/app_utility/common_function.dart';
import 'package:kupf/app_utility/image_string.dart';
import 'package:kupf/presentation/controller/login/login_controller.dart';
import 'package:kupf/widgets/button_widget.dart';
import 'package:kupf/widgets/curve_box_decoration.dart';
import 'package:kupf/widgets/k_text.dart';
import 'package:kupf/widgets/k_textfield.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../widgets/loading.dart';
import '../../../app/routes/routes.dart';
import '../../../languages/language_constants.dart';
import '../../../widgets/social_icon_widget.dart';
import '../../../widgets/dialogs/fogot_password_dialog.dart';

class SignInView extends GetView<LoginController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkDevice();
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
              SingleChildScrollView(
                child: CurvedBoxDecoration(
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
                        if (controller.isPhone.value)
                        LabelTextField(
                          // labelText: AppString.phoneNumber,
                          controller: controller.phoneController,
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
                                Get.log("DialCode::: ${value.dialCode}");
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
                        if (controller.isPhone.value)
                        AppUtility.heightBox,
                        if (!controller.isPhone.value)
                        LabelTextField(
                          // labelText: AppString.phoneNumber,
                          controller: controller.emailController,
                          hintText: LanguageConstants.email.tr,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LanguageConstants.emailRequired.tr;
                            } /*else if (!GetUtils.isEmail(value)) {
                              return LanguageConstants.invalidEmail.tr;
                            }*/
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.email_outlined),
                            onPressed: () {},
                          ),
                        ),
                        if (!controller.isPhone.value)
                        AppUtility.heightBox,
                        LabelTextField(
                          controller: controller.passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: controller.obscureText.value,
                          labelText: LanguageConstants.password.tr,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LanguageConstants.required.tr;
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              icon: controller.obscureText.value
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.remove_red_eye),
                              onPressed: () {
                                controller.obscureText.value =
                                    !controller.obscureText.value;
                              }),
                        ),
                        AppUtility.heightBox,
                        AppUtility.heightBox,
                        Row(
                          children: [
                            if (GetPlatform.isIOS)
                              CupertinoSwitch(
                                value: controller.rememberMe.value,
                                activeColor: mainColor.value,
                                onChanged: (value) {
                                  controller.rememberMe(value);
                                },
                              ),
                            if (GetPlatform.isAndroid)
                              Switch(
                                value: controller.rememberMe.value,
                                activeColor: mainColor.value,
                                onChanged: (value) {
                                  controller.rememberMe(value);
                                },
                              ),
                            const SizedBox(width: 8.0),
                            Text(LanguageConstants.rememberMe.tr),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    backgroundColor: scaffoldColor.value,
                                    title: LanguageConstants.forgotPassword.tr.replaceAll("?", ""),
                                    titlePadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 16,
                                    ),
                                    titleStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                                    content: const ForgotPasswordDialog(),
                                  );
                                },
                                child:
                                    KText(LanguageConstants.forgotPassword.tr))
                          ],
                        ),
                        AppUtility.heightBox,
                        AppButtonElevated(
                          text: LanguageConstants.signIn.tr,
                          onPressed: controller.login,
                        ),
                        // AppUtility.height32Box,
                        // RichText(
                        //   text: TextSpan(
                        //     text: LanguageConstants.dontHaveAccount.tr,
                        //     style: AppTextTheme.bodyText1grey,
                        //     children: [
                        //       TextSpan(
                        //         text: LanguageConstants.signUp.tr,
                        //         style: AppTextTheme.bodyText1Primary
                        //             .copyWith(fontWeight: FontWeight.bold),
                        //         recognizer: TapGestureRecognizer()
                        //           ..onTap = () => Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (_) => const SignUpView())),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        AppUtility.height32Box,
                        // social signin
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (controller.localAuthController.isSupported)
                              SocialIconWidget(
                                color: mainColor.value,
                                icon: MdiIcons.fingerprint,
                                onPressed: controller.localAuthController.isSupported && controller.localAuthController.isEnable ? controller.localAuth : null,
                              ),
                            AppUtility.widthBox,
                            SocialIconWidget(
                              color: mainColor.value,
                              icon: controller.isPhone.value ? MdiIcons.email : MdiIcons.phone,
                              onPressed: () =>
                                  controller.isPhone(!controller.isPhone.value),
                            ),
                            AppUtility.widthBox,
                            SocialIconWidget(
                              color: Colors.redAccent,
                              icon: MdiIcons.google,
                              onPressed: controller.signInWithGoogle,
                            ),
                            AppUtility.widthBox,
                            SocialIconWidget(
                              color: const Color(0XFF4267B2),
                              icon: MdiIcons.facebook,
                              onPressed: controller.signInWithFaceBook,
                            ),
                            if (GetPlatform.isIOS) AppUtility.widthBox,
                            if (GetPlatform.isIOS)
                              SocialIconWidget(
                                color: Colors.black,
                                icon: MdiIcons.apple,
                                onPressed: controller.signInWithApple,
                              ),
                            // FutureBuilder(
                            //     future: _controller.checkDevice(),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData && snapshot.data != null) {
                            //         bool manufacturer = snapshot.data as bool;
                            //         if (manufacturer) {
                            //           return Row(
                            //             children: [
                            //               AppUtility.widthBox,
                            //               SocialIconWidget(
                            //                 color: Colors.white,
                            //                 path: "assets/huawei-logo.svg",
                            //                 onPressed: () async {
                            //                   _controller.signInWithHuawei();
                            //                   // loginController.verifySocialLogin(info, false, true, false);
                            //                 },
                            //               ),
                            //             ],
                            //           );
                            //         }
                            //       }
                            //       return const SizedBox();
                            //     }),
                          ],
                        ),
                        AppUtility.height32Box,
                        RichText(
                          text: TextSpan(
                            text: LanguageConstants.loginAs.tr,
                            style: AppTextTheme.bodyText1grey,
                            children: [
                              TextSpan(
                                text: LanguageConstants.guest.tr,
                                style: AppTextTheme.bodyText1Primary
                                    .copyWith(fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.offAllNamed(AppRoutes.home),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.isAction.value) const LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class AppSpacing {
  static const padding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0);
  static const vertical = SizedBox(height: 16);
  static const vertical2 = SizedBox(height: 32);
  static const emptyBox = SizedBox.shrink();
}
