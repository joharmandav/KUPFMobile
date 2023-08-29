import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app_utility/app_color.dart';
import '../../app_utility/common_function.dart';
import '../../languages/language_constants.dart';
import '../../presentation/controller/main/general_controller.dart';
import '../../presentation/providers/drawer_provider.dart';
import '../../app/routes/routes.dart';
import 'drawer_tile.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var format = DateFormat('d MMM y');
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage("assets/tuxedo.png"),
                        radius: 60,
                        backgroundColor: mainColor.value,
                      ),
                      if (Get.find<GeneralController>().status == 1)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: SizedBox(width: 145, child: Text(Get.find<GeneralController>().detailedEmployeeModel?.englishName ?? "Guest User", overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,), maxLines: 1, ))),
                          ],
                        ) else const Text("Guest", style: TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w700,),),
                    ],
                  ),
                ),
                DrawerTile(
                    title: LanguageConstants.profile.tr,
                    leading: const Icon(Icons.account_circle, color: AppColor.white),
                    onTap: () async {
                      if (!Get.find<GeneralController>().checkStatus()) {
                        await Get.find<GeneralController>()
                            .storeData('route', 'profile');
                        var result =
                        await Get.toNamed(AppRoutes.login);
                        if (result ?? false) {
                          await Get.find<GeneralController>().storageBox.remove("route");
                          drawerNotifier.value = DrawerState.profile;
                          Get.back();
                        }
                      } else {
                        drawerNotifier.value = DrawerState.profile;
                        Get.back();
                      }
                    }),
                DrawerTile(
                    title: LanguageConstants.serviceProcured.tr,
                    leading: const Icon(Icons.design_services,
                        color: AppColor.white),
                    onTap: () async {
                      if (!Get.find<GeneralController>().checkStatus()) {
                        await Get.find<GeneralController>()
                            .storeData('route', 'service');
                        var result =
                        await Get.toNamed(AppRoutes.login);
                        if (result ?? false) {
                          await Get.find<GeneralController>().storageBox.remove("route");
                          drawerNotifier.value = DrawerState.service;
                          Get.back();
                        }
                      } else {
                        drawerNotifier.value = DrawerState.service;
                        Get.back();
                      }
                    }),
                DrawerTile(
                  title: LanguageConstants.onLineForm.tr,
                  leading: const Icon(Icons.format_align_center,
                      color: AppColor.white),
                  onTap: () async {
                    drawerNotifier.value = DrawerState.onlineForm;
                    Get.back();
                  },
                ),
                DrawerTile(
                    title: LanguageConstants.specialService.tr,
                    leading: const Icon(Icons.list, color: AppColor.white),
                    onTap: () {
                      drawerNotifier.value = DrawerState.specialService;
                      Get.back();
                    }),
                DrawerTile(
                    title: LanguageConstants.settings.tr,
                    leading:
                    const Icon(Icons.settings, color: AppColor.white),
                    onTap: () {
                      drawerNotifier.value = DrawerState.settings;
                      Get.back();
                    }),
                DrawerTile(
                    title: Get.find<GeneralController>().checkStatus()
                        ? LanguageConstants.logout.tr
                        : LanguageConstants.signIn.tr,
                    leading: Icon(
                        Get.find<GeneralController>().checkStatus()
                            ? Icons.logout
                            : Icons.login_outlined,
                        color: AppColor.white),
                    onTap: () async {
                      //drawerNotifier.value = DrawerState.logout;
                      if (Get.find<GeneralController>().checkStatus()) {
                        await Get.find<GeneralController>().logout();
                        Get.offAllNamed(AppRoutes.login);
                      } else {
                        Get.offNamed(AppRoutes.login);
                      }
                    }),
                // ExpansionTile(
                //   expandedAlignment: Alignment.centerLeft,
                //   iconColor: AppColor.white,
                //   collapsedIconColor: AppColor.white,
                //   leading: const Icon(Icons.format_align_center,
                //       color: AppColor.white),
                //   title: KText(LanguageConstants.onLineForm.tr,
                //       style: AppTextTheme.bodyText1white),
                //   children: [
                //     _DrawerTile(
                //         title: LanguageConstants.conditionsOfMembership.tr,
                //         onTap: () {
                //           drawerNotifier.value =
                //               DrawerState.onlineForm;
                //           Get.back();
                //         }),
                //     _DrawerTile(
                //         title: LanguageConstants.subTwo.tr,
                //         onTap: () {
                //           drawerNotifier.value =
                //               DrawerState.onlineForm;
                //           Get.back();
                //         }),
                //     _DrawerTile(
                //         title: LanguageConstants.subThree.tr,
                //         onTap: () {
                //           drawerNotifier.value = DrawerState.onlineForm;
                //           Get.back();
                //         }),
                //   ],
                // ),

                // ListTile(
                //     title: KText('Language', style: AppTextTheme.bodyText1white),
                //     leading: const Icon(Icons.translate, color: AppColor.white),
                //     trailing: CupertinoSwitch(
                //       //activeColor: AppColor.primary,
                //       onChanged: (bool value) {},
                //       value: true,
                //     )),
              ],
            ),
          ),
          Expanded(
              flex: 0,
              child: Column(
                children: [
                  Text("${format.format(DateTime.parse(LanguageConstants.date))} ${LanguageConstants.updated.tr}", style: Get.theme.textTheme.caption!.copyWith(color: AppColor.white),),
                  AppUtility.heightBoxMin,
                  Text(
                    "${LanguageConstants.version.tr} ${LanguageConstants.versionNo}",
                    style: Get.theme.textTheme.caption!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              )),
          AppUtility.heightBoxMin,
        ],
      ),
    );
  }
}
