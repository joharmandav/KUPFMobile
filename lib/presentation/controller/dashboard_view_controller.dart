import 'package:get/get.dart';
import 'package:kupf/presentation/controller/main/general_controller.dart';

class DashboardViewController extends GetxController {
  final controller = Get.find<GeneralController>();
  RxBool _isLinked = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    updateUI();
  }

  void updateUI() {
    var value = controller.storageBox.read("link");
    if (value != null) {
      _isLinked(value);
    }
  }

  Future<void> linkedWithLocalAuth(bool value) async {
    await controller.storageBox.write("link", value);
    updateUI();
  }

  bool get isLinked => _isLinked.value;
}