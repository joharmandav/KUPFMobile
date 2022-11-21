import 'package:get/get.dart';
import 'package:kupf/presentation/controller/main/general_controller.dart';

class SettingsController extends GetxController {
  final RxBool _isArabic = RxBool(Get.find<GeneralController>().isArabic());

  bool get isArabic => _isArabic.value;

  set isArabic(bool value) {
    _isArabic(value);
  }
}