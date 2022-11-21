import 'package:get/get.dart';

import '../app/server/database/database.dart';
import '../app/server/database/kupf_database.dart';
import '../presentation/controller/connectivity_controller.dart';
import '../presentation/controller/main/general_controller.dart';

class AppServices {
  static final AppServices _instance = AppServices._();

  AppServices._();

  factory AppServices() => _instance;

  Future<void> initServices() async {
    Get.log('starting services ...');
    Get.put(GeneralController());
    await Get.putAsync(() => DatabaseManager().initialize());
    await Get.putAsync(() => DbManager().database);
    await Get.putAsync(() => ConnectivityService().initialize());
    /// Here is where you put get_storage, hive, shared_pref initialization.
    /// or moor connection, or whatever that's async.
    try {
      // DbManager db = DbManager();
      await Get.putAsync(() => DbManager().database);
      // DbManager().getFunctionUser();
      // DbManager().getDetailedEmployee();
    } on Exception catch (e) {
      Get.log("ERROR::: ${e.toString()}");
    }
    Get.log('All services started...');
  }
}