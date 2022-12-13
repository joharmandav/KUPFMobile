import 'package:get/get.dart';
import 'package:kupf/presentation/controller/login/local_auth/local_auth_controller.dart';
import 'package:kupf/presentation/controller/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LocalAuthController>(() => LocalAuthController());
  }
}