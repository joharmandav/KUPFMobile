import 'package:get/get.dart';
import 'package:kupf/presentation/bindings/user/login_binding.dart';
import 'package:kupf/presentation/screen/sigin_view/forgot_password_view.dart';
import 'package:kupf/presentation/screen/sigin_view/otp_verification.dart';
import 'package:kupf/presentation/screen/sigin_view/reset_password_view.dart';
import '../../presentation/bindings/home_binding.dart';
import '../../presentation/bindings/user/forgot_binding.dart';
import '../../presentation/bindings/user/otp_verification_binding.dart';
import '../../presentation/bindings/user/reset_password_binding.dart';
import '../../presentation/screen/main_view/main_view.dart';
import '../../presentation/screen/sigin_view/sigin_view.dart';
import '../../presentation/screen/signup_view/sign_up_view.dart';
import '../../presentation/screen/splash_view/splash_view.dart';
import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const MainView(), binding: HomeBinding()),
    GetPage(name: AppRoutes.login, page: () => const SignInView(), binding: LoginBinding()),
    GetPage(name: AppRoutes.register, page: () => const SignUpView()),
    GetPage(name: AppRoutes.initial, page: () => const SplashView()),
    GetPage(name: AppRoutes.reset, page: () => const ResetPasswordView(), binding: ResetPasswordBinding()),
    GetPage(name: AppRoutes.forgot, page: () => const ForgotPasswordView(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.otpVerification, page: () => const OTPVerification(), binding: OTPVerificationBinding()),
  ];
}