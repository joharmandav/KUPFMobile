import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/helper/toaster.dart';
import 'package:kupf/presentation/controller/main/general_controller.dart';

import '../../../../app_utility/app_color.dart';
import '../../../../languages/language_constants.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/circle_color_picker.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({Key? key}) : super(key: key);

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  Color currentColor = mainColor.value;
  Color scaffoldBgColor = scaffoldColor.value;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
        builder: (context, )  {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: currentColor,
          title: Text(LanguageConstants.changeColor.tr),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleColorPicker(
                  initialColor: Get.theme.primaryColor,
                  text: "Foreground",
                  onChanged: (Color color) {
                    currentColor = color;
                    setState(() {});
                  },
                ),
              ),
              Center(
                child: CircleColorPicker(
                  text: "Background",
                  initialColor: Get.theme.scaffoldBackgroundColor,
                  onChanged: (Color color) {
                    scaffoldColor.value = color;
                    setState(() {});
                  },
                ),
              ),
              AppButtonElevated(
                  text: LanguageConstants.saveChange.tr,
                  primaryColor: currentColor,
                  onPressed: () {
                    Get.find<GeneralController>().storageBox.write("color", "#${currentColor.value.toRadixString(16)}");
                    Color? value = Get.find<GeneralController>().checkColor();
                    mainColor.value = value!;
                    Toaster.showConfirm(LanguageConstants.successChange.tr);
                    Get.back();
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}
