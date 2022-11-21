import 'package:get/get.dart';
import 'package:kupf/presentation/controller/connectivity_controller.dart';
import 'package:kupf/presentation/models/service_setup_model.dart';

import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/kupf_database.dart';

class ServiceSetupController extends GetxController {
  final RxBool _isLoading = RxBool(false);
  final ConnectivityService _connectivityService = ConnectivityService();
  final RxList<ServiceSetupModel> _serviceSetupList = RxList<ServiceSetupModel>();

  Future<void> getServiceSetup() async {
    _isLoading(true);
    final serviceSetup = await getServicesFormLocal();
    if (serviceSetup.isEmpty) return;
    Get.log(serviceSetup.length.toString());
    _serviceSetupList.assignAll(serviceSetup);
    _isLoading(false);
  }

  Future<List<ServiceSetupModel>> getServicesFormLocal() async {
    if (await _connectivityService.checkConnectivity()) {
      return await ApiProvider().getServiceSetup();
    }
    return await DbManager().getServiceSetup();
  }


  @override
  void onInit() {
    super.onInit();
    getServiceSetup();
  }

  List<ServiceSetupModel> get serviceSetUPList => List<ServiceSetupModel>.from(_serviceSetupList);

  bool get isLoading => _isLoading.value;
}