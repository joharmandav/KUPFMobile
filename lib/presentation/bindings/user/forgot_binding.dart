import 'package:get/get.dart';
import '../../controller/login/forgot_password_dialog_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordDialogController>(() => ForgotPasswordDialogController());
  }

}