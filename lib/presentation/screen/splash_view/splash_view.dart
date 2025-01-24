import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/image_string.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';

import '../../../app/routes/routes.dart';
import '../../../app/server/database/db_constant.dart';
import '../../../app_utility/common_function.dart';
import '../../../languages/language_constants.dart';
import '../../../name.dart';
import '../../models/login_response_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static const _duration = Duration(milliseconds: 1600);
  var format = DateFormat('d MMM y');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                mainColor.value,
                AppColor.white,
              ],
            ),
          ),
          child: TweenAnimationBuilder<double>(

            onEnd: () => Get.find<GeneralController>().checkStatus() ? Get.offAllNamed(AppRoutes.home) :
                Get.offNamed(AppRoutes.login),
            tween: Tween(begin: 0.0, end: 1.0),
            duration: _duration,
            builder: (_, value, child) => Padding(
              padding: EdgeInsets.only(
                  top: 100 * value, bottom: 100, right: 28.0, left: 28.0),
              child: Opacity(opacity: value, child: child),
            ),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: Image(image: ImageString.logo),
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: Column(
                      children: [
                        Text(
                          "${format.format(DateTime.parse(LanguageConstants.date))} ${LanguageConstants.updated.tr}",
                          style: Get.theme.textTheme.bodySmall!
                              .copyWith(color: AppColor.blackLight),
                        ),
                        AppUtility.heightBoxMin,
                        Text(
                          "${LanguageConstants.version.tr} ${LanguageConstants.versionNo}",
                          style: Get.theme.textTheme.bodySmall!
                              .copyWith(color: AppColor.blackLight),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
