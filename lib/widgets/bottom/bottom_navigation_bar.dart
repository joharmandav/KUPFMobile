import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/routes.dart';
import '../../app_utility/app_color.dart';
import '../../app_utility/image_string.dart';
import '../../presentation/controller/main/general_controller.dart';
import '../../presentation/providers/drawer_provider.dart';
import '../../presentation/screen/sigin_view/sigin_view.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: mainColor,
      builder: (context, Color value, child) {
        return CurvedNavigationBar(
          backgroundColor: scaffoldColor.value,
          index: 0,
          letIndexChange: (index) {
            return true;
          },
          animationDuration: const Duration(milliseconds: 400),
          color: value,
          items: const <Widget>[
            // Image(image: ImageString.website, height: 30),
            Icon(Icons.home, size: 30,),
            Icon(Icons.account_circle, size: 30),
            Icon(Icons.design_services, size: 30),
            Image(
              image: ImageString.specialService,
              height: 30,
              color: Colors.white,
            ),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) async {
            if (index == 1 && !Get.find<GeneralController>().checkStatus()) {
              await Get.find<GeneralController>().storageBox.write("route", "profile");
              var result = await Get.toNamed(AppRoutes.login);
              if (result ?? false) {
                await Get.find<GeneralController>().storageBox.remove("route");
                drawerNotifier.value = DrawerState.values.elementAt(index);
              }
              return;
            }
            if (index == 2 && !Get.find<GeneralController>().checkStatus()) {
              await Get.find<GeneralController>().storageBox.write("route", "service");
              var result = await Get.toNamed(AppRoutes.login);
              if (result ?? false) {
                await Get.find<GeneralController>().storageBox.remove("route");
                drawerNotifier.value = DrawerState.values.elementAt(index);
              }
              return;
            }
            drawerNotifier.value = DrawerState.values.elementAt(index);
          },
        );
      },
    );
  }
}
