import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/main_view/home/dashboard_view.dart';
import '../../screen/main_view/online_form_body/online_form_view.dart';
import '../../screen/main_view/profile_body/profile_body.dart';
import '../../screen/main_view/service_body/sevice_body.dart';
import '../../screen/main_view/settings/settings.dart';
import '../../screen/main_view/special_service_body/special_service_body.dart';

class HomeController extends GetxController {
  final RxInt _tabIndex = RxInt(0);

  List<Widget> bodyWidgets = [
    const DashboardView(),
    const ProfileBody(),
    const ServiceBody(),
    const SpecialServices(),
    const SettingsScreen(),
    const OnlineFormView(),
  ];

  int get tabIndex => _tabIndex.value;

  set tabIndex(int value) {
    _tabIndex(value);
  }
}