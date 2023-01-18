import 'package:flutter/material.dart';
import 'package:kupf_mobile/app_localizations.dart';

extension StringExtension on String {


  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}