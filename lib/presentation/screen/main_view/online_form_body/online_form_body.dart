import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/app_utility/app_color.dart';
import 'package:kupf/app_utility/app_text_theme.dart';
import 'package:kupf/app_utility/common_function.dart';
import 'package:kupf/widgets/button_widget.dart';
import 'package:kupf/widgets/k_text.dart';

import '../../../../languages/language_constants.dart';
import '../../../../widgets/curve_box_decoration.dart';

class OnLineFormBody extends StatefulWidget {
  const OnLineFormBody({Key? key}) : super(key: key);

  @override
  State<OnLineFormBody> createState() => _OnLineFormBodyState();
}

class _OnLineFormBodyState extends State<OnLineFormBody> {
  bool _accept = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: KText('KUPF', style: AppTextTheme.bodyText1white),
          bottom: const PreferredSize(
              preferredSize: Size(0.0, 5), child: AppUtility.emptyBox),
        ),
        body: CurvedBoxDecoration(
          child: ListView(
            children: [
              KText(LanguageConstants.conditionsOfMembership.tr,
                  style: AppTextTheme.bodyText1Black
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              Text(LanguageConstants.membershipDescription.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              Text(LanguageConstants.memberShipCondition1.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              Text(LanguageConstants.memberShipCondition2.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              Text(LanguageConstants.memberShipCondition3.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              CheckboxListTile(
                activeColor: mainColor.value,
                value: _accept,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  _accept = value!;
                  setState(() {
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(LanguageConstants.agreement.tr),
              ),
              AppUtility.heightBox,
              AppUtility.heightBox,
              AppButtonElevated(text: LanguageConstants.submit.tr, onPressed: _accept?(){}:null),
            ],
          ),
        ),
      ),
    );
  }
}



class OnLineFormBodyTwo extends StatefulWidget {
  const OnLineFormBodyTwo({Key? key}) : super(key: key);

  @override
  State<OnLineFormBodyTwo> createState() => _OnLineFormBodyTwoState();
}

class _OnLineFormBodyTwoState extends State<OnLineFormBodyTwo> {
  bool _accept = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: KText('KUPF', style: AppTextTheme.bodyText1white),
          bottom: const PreferredSize(
              preferredSize: Size(0.0, 5), child: AppUtility.emptyBox),
        ),
        body: CurvedBoxDecoration(
          child: ListView(
            children: [
              KText(LanguageConstants.subTwo.tr,
                  style: AppTextTheme.bodyText1Black
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              Text(LanguageConstants.msvMembershipDescription.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),

              AppUtility.heightBox,
              AppUtility.heightBox,
              CheckboxListTile(
                activeColor: mainColor.value,
                value: _accept,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  _accept = value!;
                  setState(() {
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(LanguageConstants.agreement.tr),
              ),
              AppUtility.heightBox,
              AppUtility.heightBox,
              AppButtonElevated(text: LanguageConstants.submit.tr, onPressed: _accept?(){}:null),
            ],
          ),
        ),
      ),
    );
  }
}


class OnLineFormBodyThree extends StatefulWidget {
  const OnLineFormBodyThree({Key? key}) : super(key: key);

  @override
  State<OnLineFormBodyThree> createState() => _OnLineFormBodyThreeState();
}

class _OnLineFormBodyThreeState extends State<OnLineFormBodyThree> {
  bool _accept = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: KText('KUPF', style: AppTextTheme.bodyText1white),
          bottom: const PreferredSize(
              preferredSize: Size(0.0, 5), child: AppUtility.emptyBox),
        ),
        body: CurvedBoxDecoration(
          child: ListView(
            children: [
              KText(LanguageConstants.subThree.tr,
                  style: AppTextTheme.bodyText1Black
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              Text(LanguageConstants.ssfMembershipTerminatedCasesDescription.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              Text(LanguageConstants.terminatedCases1.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              Text(LanguageConstants.terminatedCases2.tr,
                  style: AppTextTheme.bodyText1Black.copyWith(fontSize: 16)),
              AppUtility.heightBox,
              AppUtility.heightBox,
              CheckboxListTile(
                activeColor: mainColor.value,
                value: _accept,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  _accept = value!;
                  setState(() {
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(LanguageConstants.agreement.tr),
              ),
              AppUtility.heightBox,
              AppUtility.heightBox,
              AppButtonElevated(text: LanguageConstants.submit.tr, onPressed: _accept?(){}:null),
            ],
          ),
        ),
      ),
    );
  }
}
