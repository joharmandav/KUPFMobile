import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_text_theme.dart';
import 'package:kupf_mobile/app_utility/common_function.dart';
import 'package:kupf_mobile/app_utility/image_string.dart';
import 'package:kupf_mobile/widgets/button_widget.dart';
import 'package:kupf_mobile/widgets/curve_box_decoration.dart';
import 'package:kupf_mobile/widgets/k_textfield.dart';

import '../../../languages/language_constants.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(LanguageConstants.signUp.tr),
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
        body: CurvedBoxDecoration(
          child: ListView(
            children:  [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Image(image: ImageString.logo),
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.fullName.tr,
                hintText: LanguageConstants.fullName.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.departmentWorking.tr,
                hintText: LanguageConstants.department.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.kuwaitUniversityId.tr,
                hintText: LanguageConstants.kuwaitUniversityId.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.civilID.tr,
                hintText: LanguageConstants.civilID.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.positionHeIsOn.tr,
                hintText: LanguageConstants.positionHeIsOn.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.userId.tr,
                hintText: LanguageConstants.userId.tr,
              ),
              AppUtility.heightBox,
              LabelTextField(
                labelText: LanguageConstants.password.tr,
                hintText: LanguageConstants.password.tr,
              ),
              AppUtility.heightBox,
              AppUtility.heightBox,
              AppUtility.heightBox,
              AppButtonElevated(text: LanguageConstants.register.tr, onPressed: (){

              }),
            ],
          ),
        ),
      ),
    );
  }
}
