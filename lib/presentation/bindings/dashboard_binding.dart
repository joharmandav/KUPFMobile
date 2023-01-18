import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/dashboard_view_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardViewController>(() => DashboardViewController());
  }
}