import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:kupf_mobile/widgets/k_text.dart';
import '../../../../app_utility/common_function.dart';
import '../../../../languages/language_constants.dart';
import '../../../controller/dashboard_view_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardViewController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(LanguageConstants.home.tr,),
              if (!controller.isLinked)
                ElevatedButton(onPressed: () async {
                  await controller.linkedWithLocalAuth(true);
                }, child: Text(LanguageConstants.link.tr)),
            ],
          ),),
          AppUtility.heightBox,
          Image.asset("assets/dashboard.jpg"),
          AppUtility.height32Box,
        ],
      ),
    );
  }
}
