import 'package:flutter/material.dart';
import 'package:kupf/app_utility/constants.dart';
import 'package:kupf/presentation/screen/sigin_view/sigin_view.dart';
import 'package:kupf/presentation/screen/splash_view/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initial:
        return MaterialPageRoute(builder: (_) => const SplashView());
        case RouteString.login:
        return MaterialPageRoute(builder: (_) => const SignInView());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child:  Text('ERROR'),
        ),
      );
    });
  }
}



