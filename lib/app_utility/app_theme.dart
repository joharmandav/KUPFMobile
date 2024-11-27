import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/app_text_theme.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = _lightTheme;
  static ThemeData darkTheme = _darkTheme;
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Get.find<GeneralController>().checkColor() ?? AppColor.white,
   iconTheme: const IconThemeData(color: AppColor.white),
  appBarTheme:  AppBarTheme(
      elevation: 0.0,
      backgroundColor: mainColor.value,
      iconTheme: const IconThemeData(color: AppColor.white),
      titleTextStyle: AppTextTheme.bodyText1white.copyWith(fontSize: 26 , fontFamily: 'ZillaSlab' , fontStyle: FontStyle.italic)),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      //borderRadius: BorderRadius.circular(12.0),
    ),
  ),
);

ThemeData _darkTheme = ThemeData.dark();
