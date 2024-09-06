import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/app_utility/app_theme.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:kupf_mobile/services/app_servces.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app/routes/pages.dart';
import 'app/routes/routes.dart';
import 'app_utility/app_color.dart';
import 'app_utility/app_text_theme.dart';
import 'languages/language.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices().initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: scaffoldColor,
        builder: (context, Color scaffoldValue, child) {
          return ValueListenableBuilder(
            valueListenable: mainColor,
            builder: (BuildContext context, Color value, Widget? child) {
              Map<int, Color> color = {
                50: value.withOpacity(0.05),
                100: value.withOpacity(0.1),
                200: value.withOpacity(0.2),
                300: value.withOpacity(0.4),
                400: value.withOpacity(0.5),
                500: value.withOpacity(0.6),
                600: value.withOpacity(0.7),
                700: value.withOpacity(0.8),
                800: value.withOpacity(0.9),
                900: value,
              };
              MaterialColor materialColor =
              MaterialColor(0xFF567DF4, color);
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.initial,
                builder: (context, child) => ResponsiveWrapper.builder(
                  child,
                  // maxWidth: 1200,
                  // minWidth: 480,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(360, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(600, name: TABLET),
                    ResponsiveBreakpoint.resize(800, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
                  ],
                ),
                title: 'KUPF',
                theme: ThemeData(
                  scaffoldBackgroundColor: scaffoldValue,
                  primaryColor: value,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: value,
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(value),
                    ),
                  ),
                  indicatorColor: value,
                  dialogTheme: DialogTheme(
                    backgroundColor: scaffoldValue,
                  ),
                  drawerTheme: DrawerThemeData(
                    backgroundColor: value,
                    scrimColor: value,
                  ),
                  // fontFamily: GoogleFonts.raleway().fontFamily,
                  textTheme: TextTheme(
                    displaySmall: TextStyle(
                      color: mainColor.value,
                      fontWeight: FontWeight.w600,
                    ),
                    headlineSmall: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    titleLarge: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  iconTheme: const IconThemeData(color: AppColor.white),
                  appBarTheme: AppBarTheme(
                      elevation: 0.0,
                      backgroundColor: value,
                      iconTheme: const IconThemeData(color: AppColor.white),
                      titleTextStyle: AppTextTheme.bodyText1white.copyWith(fontSize: 26, fontWeight: FontWeight.bold)), colorScheme: ColorScheme.fromSwatch(primarySwatch: materialColor).copyWith(background: scaffoldValue),
                ),
                themeMode: ThemeMode.light,
                darkTheme: AppTheme.darkTheme,
                translations: LanguagesChang(),
                locale: Locale('${Get.find<GeneralController>().storageBox.read('languageCode') ?? 'en'}',
                    '${Get.find<GeneralController>().storageBox.read('countryCode') ?? 'US'}'),
                fallbackLocale: Locale('${Get.find<GeneralController>().storageBox.read('languageCode')}',
                    '${Get.find<GeneralController>().storageBox.read('countryCode')}'),
                getPages: AppPages.pages,
              );
            },
          );
        });

  }
}
