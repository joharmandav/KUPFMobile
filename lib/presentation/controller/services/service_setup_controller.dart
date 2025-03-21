import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/connectivity_controller.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/kupf_database.dart';
import '../../models/serviceSetup_model.dart';

class ServiceSetupController extends GetxController {
  final _apiProvider = Get.find<ApiProvider>();
  final RxBool _isLoading = RxBool(false);
  final ConnectivityService _connectivityService = ConnectivityService();
  final RxList<ServiceSetupModel> _serviceSetupList = RxList<ServiceSetupModel>();

  Future<void> getServiceSetup() async {
    _isLoading(true);
    final serviceSetup = await getServicesFormLocal();
    _serviceSetupList.assignAll(serviceSetup);
    _isLoading(false);
  }

  Future<List<ServiceSetupModel>> getServicesFormLocal() async {
    if (await _connectivityService.checkConnectivity()) {
      final _controller = Get.find<GeneralController>();
      // Map<String, String> header = {
      //   "Authorization" : "Bearer ${_controller.readData("token")}",
      // };
      return await _apiProvider.getServiceSetup();
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