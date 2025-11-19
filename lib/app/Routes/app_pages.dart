import 'package:get/get.dart';
import 'package:safarisooqapp/app/modules/adDisplay/bindings/adDisplay_binding.dart';

import '../modules/adDisplay/views/adDisplay_view.dart';
import '../modules/auth/forgetpassword/views/page.dart';
import '../modules/auth/login/views/page.dart';
import '../modules/auth/register/views/page.dart';
import '../modules/auth/register/views/user_verify.dart';
import '../modules/auth/resetpassword/bindings/reset_password_binding.dart';
import '../modules/auth/resetpassword/views/page.dart';
import '../modules/auth/verify/views/page.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/views/page.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => ForgetPasswordPage(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpPage(),
    ),
    GetPage(
      name: Routes.RESETPASSWORD,
      page: () => ResetPasswordPage(),
    ),
    GetPage(
      name: Routes.USERVERIFY,
      page: () => UserVerifyPage(),
    ),

    
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
     GetPage(
      name: Routes.ADDISPLAY,
      page: () => const AddisplayView(),
      binding: AddisplayBinding(),
    ),

    
  ];
}
