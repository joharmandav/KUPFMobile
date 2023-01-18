

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';

import '../presentation/providers/drawer_provider.dart';

abstract class AppColor {
  // static const primary = Color(0xFF567DF4);
  static const transparent = Colors.transparent;
  static const black = Colors.black;
  static const blackLight = Colors.black87;
  static const white = Colors.white;
  static const grey = Colors.grey;
}

ValueNotifier<Color> mainColor = ValueNotifier(Get.find<GeneralController>().checkColor() ?? HexColor("#567DF4"));
ValueNotifier<Color> scaffoldColor = ValueNotifier(Colors.white);
final ValueNotifier<DrawerState> drawerNotifier = ValueNotifier(DrawerState.home);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}