import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {

  final RxBool newObscureText = RxBool(true);
  final RxBool currentObscureText = RxBool(true);
  final RxBool isLoading = RxBool(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController currentPassword = TextEditingController();
}