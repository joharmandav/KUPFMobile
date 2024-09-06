import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: const Color(0x60928B8B),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 3.0,
          shadowColor: Colors.grey,
          color: Colors.white,
          child: Container(
            height: Get.height * 0.1,
            width: Get.width * 0.6,
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Center(child: CircularProgressIndicator(color: mainColor.value,),),
                const SizedBox(width: 16,),
                Text("Please Wait...",
                  style: Get.theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
