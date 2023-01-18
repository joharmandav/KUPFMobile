import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/screen/main_view/online_form_body/online_form_body.dart';

import '../../../../app_utility/app_text_theme.dart';
import '../../../../app_utility/common_function.dart';
import '../../../../languages/language_constants.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/k_text.dart';

class OnlineFormView extends StatelessWidget {
  const OnlineFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
            child: ListTile(
              onTap: () => Get.to(() => const OnLineFormBody()),
              leading: Image.asset("assets/membership.png", height: 40, width: 40,),
              title: KText( LanguageConstants.conditionsOfMembership.tr,
                style: AppTextTheme.bodyText1Black.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,),),
            ),
          ),
          AppUtility.heightBox,
          AppUtility.heightBox,

          CustomCard(
            child: ListTile(
              onTap: () => Get.to(() => const OnLineFormBodyTwo()),
              leading: Image.asset("assets/subscription.png", height: 40, width: 40,),
              title: KText( LanguageConstants.subTwo.tr,
                style: AppTextTheme.bodyText1Black.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,),),
            ),
          ),
          AppUtility.heightBox,
          AppUtility.heightBox,
          CustomCard(
            child: ListTile(
              onTap: () => Get.to(() => const OnLineFormBodyThree()),
              leading: Image.asset("assets/cancelsubscription.png", height: 40, width: 40,),
              title: KText(LanguageConstants.subThree.tr,
                style: AppTextTheme.bodyText1Black.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,),),
            ),
          ),
        ],
      ),
    );
  }
}
