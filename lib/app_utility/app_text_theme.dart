import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kupf/app_utility/app_color.dart';

abstract class AppTextTheme {
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  //static TextTheme get _aLikeTextTheme => GoogleFonts.alikeTextTheme();

  static TextStyle get bodyText1Black => _poppinsTextTheme.bodyText1!.copyWith(
        color: AppColor.black,
      );

  static TextStyle get bodyText1white => _poppinsTextTheme.bodyText1!.copyWith(
        color: AppColor.white,
      );
  static TextStyle get bodyText1grey => _poppinsTextTheme.bodyText1!.copyWith(
        color: AppColor.grey,
      );static TextStyle get bodyText1Primary => _poppinsTextTheme.bodyText1!.copyWith(
        color: mainColor.value,
      );

// static getDefaultTextTheme() => TextTheme(
//   headline5: _blackHeadline5,
//   headline6: _blackHeadline6,
//   bodyText1: _blackBody1,
//   bodyText2: _blackBody2,
//   // subtitle1: whiteSubtitle1,
//   // bodyText2: whiteBodyText2,
//   // button: _whiteButton,
//   // caption: _darkCaption,
// );
}

// {
// FontWeight.w100: 'Thin',
// FontWeight.w200: 'ExtraLight',
// FontWeight.w300: 'Light',
// FontWeight.w400: 'Regular',
// FontWeight.w500: 'Medium',
// FontWeight.w600: 'SemiBold',
// FontWeight.w700: 'Bold',
// FontWeight.w800: 'ExtraBold',
// FontWeight.w900: 'Black',
// }
