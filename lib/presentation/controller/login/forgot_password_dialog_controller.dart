import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/routes/routes.dart';


class ForgotPasswordDialogController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isPhone = RxBool(false);
  final RxnString countryCode = RxnString();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();


  void onTapEmail(){
    Get.back();
    isPhone(false);
    Get.toNamed(AppRoutes.forgot);
  }

  void onTapPhone(){
    Get.back();
    isPhone(true);
    Get.toNamed(AppRoutes.forgot);
  }
}