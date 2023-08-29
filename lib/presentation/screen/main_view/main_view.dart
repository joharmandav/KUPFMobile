import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/app_text_theme.dart';
import 'package:kupf_mobile/app_utility/common_function.dart';
import 'package:kupf_mobile/presentation/providers/drawer_provider.dart';
import 'package:kupf_mobile/presentation/screen/main_view/profile_body/profile_body.dart';
import 'package:kupf_mobile/presentation/screen/main_view/service_body/sevice_body.dart';
import 'package:kupf_mobile/presentation/screen/main_view/settings/settings.dart';
import 'package:kupf_mobile/presentation/screen/main_view/special_service_body/special_service_body.dart';
import 'package:kupf_mobile/widgets/curve_box_decoration.dart';
import 'package:kupf_mobile/widgets/k_text.dart';
import '../../../widgets/bottom/bottom_navigation_bar.dart';
import '../../../widgets/drawer/drawer_view.dart';
import '../../controller/main/home_controller.dart';
import 'home/dashboard_view.dart';
import 'online_form_body/online_form_view.dart';


class MainView extends GetView<HomeController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: KText('KUPF', style: AppTextTheme.bodyText1white),
          bottom: const PreferredSize(
              preferredSize: Size(0.0, 5), child: AppUtility.emptyBox),
        ),
        drawer: const DrawerView(),
        bottomNavigationBar: const BottomNavigationBarView(),
        body: CurvedBoxDecoration(
          child: ValueListenableBuilder<DrawerState>(
            valueListenable: drawerNotifier,
            builder: (_, state, child) => const [
              DashboardView(),
              ProfileBody(),
              ServiceBody(),
              SpecialServices(),
              SettingsScreen(),
              OnlineFormView(),
            ].elementAt(state.index),
          ),
          // child: ValueListenableBuilder<DrawerEnum>(
          //     valueListenable: widget.valueNotifier,
          //     builder: (_, value, child) => [
          //           ProfileBody(),
          //           ServiceBody(),
          //           Center(child: Text('service')),
          //           Center(child: Text('service'))
          //         ].elementAt(value.index)),
        ),
      ),
    );
  }
}
