import 'package:get/get.dart';

import '../../controller/services/service_setup_controller.dart';

class ServiceSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceSetupController>(() => ServiceSetupController());
  }
}