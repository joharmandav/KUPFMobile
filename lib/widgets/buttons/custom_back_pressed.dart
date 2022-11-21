import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf/app_utility/common_function.dart';

import '../../app_utility/app_color.dart';

class CustomBackPressed extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;

  const CustomBackPressed({Key? key, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3.0,
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: onPressed ?? Get.back,
            child: Center(
              child: Icon(
                GetPlatform.isIOS || GetPlatform.isMacOS ? Icons.arrow_back_ios : Icons.arrow_back,
                size: 16,
                color: AppColor.black,
              ),
            ),
          ),
        ),
        AppUtility.widthBox,
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.black,
            ),
          ),
      ],
    );
  }
}