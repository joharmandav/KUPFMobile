import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:kupf_mobile/presentation/screen/main_view/settings/change_color_page.dart';

import '../../../../app_utility/common_function.dart';
import '../../../../languages/language_constants.dart';
import '../../../../widgets/custom_card.dart';
import 'controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Column(
      children: [
        AppUtility.height32Box,
        CustomCard(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LanguageConstants.arabic.tr),
              Obx(
                () => Switch(
                  value: controller.isArabic,
                  onChanged: (value) {
                    late Locale locale;
                    if (value) {
                      locale = const Locale("ar", "");
                      Get.find<GeneralController>()
                          .storageBox
                          .write('languageIndex', 1);
                    } else {
                      locale = const Locale("en", "");
                      Get.find<GeneralController>()
                          .storageBox
                          .write('languageIndex', 0);
                    }
                    Get.find<GeneralController>()
                        .storageBox
                        .write('languageCode', locale.languageCode);
                    Get.find<GeneralController>()
                        .storageBox
                        .write('countryCode', locale.languageCode);
                    Get.find<GeneralController>().selectedLocale = locale;
                    Get.updateLocale(locale);
                    controller.isArabic = value;
                  },
                ),
              ),
            ],
          ),
        ),
        AppUtility.heightBox,
        GestureDetector(
          onTap: () {
            Get.to(() => const ChangeColorPage());
          },
          child: CustomCard(
            height: 50,
            width: double.infinity,
            child: Text(LanguageConstants.changeColor.tr),
          ),
        ),
      ],
    );
  }
}
