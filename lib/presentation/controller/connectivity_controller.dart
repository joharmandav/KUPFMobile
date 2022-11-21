import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  static ConnectivityService? _connectivityService;
  static final Rx<ConnectivityResult> _connectionStatus =
      Rx<ConnectivityResult>(ConnectivityResult.none);
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityService._createInstance();

  factory ConnectivityService() {
    _connectivityService ??= ConnectivityService._createInstance();
    return _connectivityService!;
  }

  Future<ConnectivityService> initialize() async {
    await initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    return this;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      internetErrorDialog();
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    } on Exception catch (e) {
      internetErrorDialog();
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // Toaster.showToast(result.toString());

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    return _updateConnectionStatus(result);
  }

  Future<bool> checkConnectivity() {
    switch (_connectionStatus.value) {
      case ConnectivityResult.mobile:
        return Future.value(true);
      case ConnectivityResult.wifi:
        return Future.value(true);
      case ConnectivityResult.none:
        return Future.value(false);
      default:
        return Future.value(false);
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus(result);
  }

  ConnectivityResult get connectionStatus => _connectionStatus.value;

  static Future<void> internetErrorDialog() {
    return Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 60,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Internet access is required \nto use this feature.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 120,
              child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cancel")),
            )
          ],
        ),
      ),
    );
  }
}
