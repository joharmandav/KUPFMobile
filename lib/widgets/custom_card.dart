import 'package:flutter/material.dart';

import '../app_utility/app_color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.height,
    this.width,
    this.borderColor,
    this.circularRadius,
    this.backgroundColor,
    required this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? circularRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.white,
          borderRadius: BorderRadius.circular(circularRadius ?? 12.0),
          border: Border.all(color: borderColor ?? AppColor.grey[200]!, width: 0.4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(0, 2),
                spreadRadius: 6.0,
                blurRadius: 5.0)
          ]),
      child: child,
    );
  }
}
