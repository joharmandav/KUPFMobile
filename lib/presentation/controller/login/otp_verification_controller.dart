import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationController extends GetxController {
  final RxnString _phone = RxnString();
  final RxnString _email = RxnString();
  final RxString _currentText = RxString("");
  late StreamController<ErrorAnimationType> errorController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final RxInt _start = RxInt(40);

  final RxBool _isTaped = RxBool(true);
  final RxBool _hasError = RxBool(false);
  bool? isLogin = false;
  final RxBool _isActive = RxBool(true);

  late var _timer;

  @override
  void onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    errorController.close();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (countDown < 1) {
          _isActive(false);
          timer.cancel();
        } else {
          _isActive(true);
          _start(countDown - 1);
        }
      },
    );
  }

  void reSend() async {
    // if (!await Connectivity.isOnline()) {
    //   Connectivity.internetErrorDialog();
    //   return;
    // }

    if (_timer.isActive) {
      return;
    } else {
      _timer.cancel();
      startTimer();
      _start(60);
    }
  }

  int get start => _start.value;

  set start(int value) {
    _start(value);
  }

  bool get hasError => _hasError.value;

  set hasError(bool value) {
    _hasError(value);
  }

  String get currentText => _currentText.value;

  set currentText(String? value) {
    _currentText(value!);
  }

  String? get phone => _phone.value;

  String? get email => _email.value;

  int get countDown => _start.value;

  bool get isActive => _isActive.value;

  bool get isTaped => _isTaped.value;

  set isTaped(bool value) {
    _isTaped(value);
  }
}