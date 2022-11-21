import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kupf/presentation/screen/sigin_view/forgot_password_view.dart';


class ForgotPasswordDialogController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isPhone = RxBool(false);
  final RxnString countryCode = RxnString();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();


  void onTapEmail(){
    Get.back();
    isPhone(false);
    Get.to(() => const ForgotPasswordView());
  }

  void onTapPhone(){
    Get.back();
    isPhone(true);
    Get.to(() => const ForgotPasswordView());
  }
}