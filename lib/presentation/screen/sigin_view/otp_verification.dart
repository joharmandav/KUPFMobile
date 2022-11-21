import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:get/get.dart';
import 'package:kupf/widgets/buttons/custom_back_pressed.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../app_utility/common_function.dart';
import '../../../languages/language_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/curve_box_decoration.dart';
import '../../controller/login/otp_verification_controller.dart';
import 'reset_password_view.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPVerificationController());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: CurvedBoxDecoration(
            child: Column(
              children: [
                AppUtility.heightBox,
                const CustomBackPressed(),
                AppUtility.height32Box,
                SizedBox(
                  height: Get.height / 3,
                  child: const FlareActor(
                    "assets/animation/otp.flr",
                    animation: "otp",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    LanguageConstants.accountVerification.tr,
                    style: Get.theme.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: LanguageConstants.enterCode.tr,
                      style: Get.theme.textTheme.subtitle2!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.formKey,
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      child: PinFieldAutoFill(
                        decoration: UnderlineDecoration(
                          textStyle: Get.theme.textTheme.headline5!
                              .copyWith(color: Colors.black),
                          colorBuilder:
                              FixedColorBuilder(Colors.black.withOpacity(0.3)),
                        ),
                        currentCode: controller.currentText,
                        onCodeSubmitted: (code) {
                          controller.currentText = code;
                          if (code.length == 6) {
                            // controller.verifyCode();
                          }
                        },
                        onCodeChanged: (code) {
                          controller.currentText = code;
                          controller.hasError = false;
                          if (code!.length == 6) {
                            // controller.verifyCode();
                          }
                        },
                      )),
                ),
                Center(
                  child: Obx(() => Text(
                        controller.hasError ? LanguageConstants.validOTP.tr : "",
                        style: Get.theme.textTheme.subtitle2!.copyWith(
                            color: Colors.red, fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "${LanguageConstants.dontReceive.tr} ",
                      style: Get.theme.textTheme.subtitle2!.copyWith(
                          color: Colors.black54, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: controller.isActive
                              ? ' ${controller.countDown} s'
                              : " ${LanguageConstants.resend.tr}",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => controller.reSend(),
                          style: Get.theme.textTheme.subtitle2!.copyWith(
                            color:
                                controller.isActive ? Colors.black54 : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                AppUtility.heightBox,
                AppButtonElevated(
                  text: LanguageConstants.verify.tr,
                  onPressed: () {
                    Get.off(() => const ResetPasswordView());

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
