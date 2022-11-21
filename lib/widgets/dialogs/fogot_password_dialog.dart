import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/app_utility/common_function.dart';
import 'package:kupf/languages/language_constants.dart';

import '../../presentation/controller/login/forgot_password_dialog_controller.dart';
import 'card/custom_phone_email_card.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({
    Key? key,
    this.email,
    this.phone,
  }) : super(key: key);

  final String? phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordDialogController());
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(LanguageConstants.whichContactDetail.tr),
          AppUtility.heightBox,
          CustomPhoneEmailCard(
            title: "${LanguageConstants.viaSMS.tr}:",
            subtitle: "**** **** 9011",
            iconData: Icons.phone_android,
            onTab: controller.onTapPhone,
          ),
          AppUtility.heightBoxMin,
          CustomPhoneEmailCard(
            title: "${LanguageConstants.viaEmail.tr}:",
            subtitle: "*****e@gmail.com",
            iconData: Icons.email_outlined,
            onTab: controller.onTapEmail,
          ),
        ],
      ),
    );
  }
}
