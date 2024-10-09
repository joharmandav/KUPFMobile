import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/connectivity_controller.dart';

import '../../../app/server/api/api_provider.dart';
import '../../../app/server/database/kupf_database.dart';
import '../../models/offers_model.dart';

class OfferController extends GetxController {
  final _apiProvider = Get.find<ApiProvider>();
  final RxBool _isLoading = RxBool(false);
  final ConnectivityService _connectivityService = ConnectivityService();
  final RxList<OffersModel> _offersList = RxList<OffersModel>();

  Future<void> getOffers() async {
    _isLoading(true);
    final offers = await getOffersFormLocal();
    _offersList.assignAll(offers);
    _isLoading(false);
  }

  Future<List<OffersModel>> getOffersFormLocal() async {
    if (await _connectivityService.checkConnectivity()) {
      return await _apiProvider.getOffers();
    }
    return await DbManager().getOffers();
  }


  @override
  void onInit() {
    super.onInit();
    getOffers();
  }

  List<OffersModel> get offersList => List<OffersModel>.from(_offersList);

  bool get isLoading => _isLoading.value;
}