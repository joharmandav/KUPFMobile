import 'package:flutter/material.dart';
import 'package:kupf/app_utility/app_text_theme.dart';

class AppButtonElevated extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final Color? primaryColor;

  const AppButtonElevated(
      {Key? key, required this.text, this.onPressed, this.width, this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          //maximumSize: Size(200, 44),
          fixedSize: Size(width ?? 340.0, 44)),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextTheme.bodyText1white.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
