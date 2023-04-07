import 'package:fos/app/modules/auth/views/login_view.dart';
import 'package:fos/app/modules/auth/views/sign_up_view.dart';
import 'package:get/get.dart';

import 'package:fos/app/modules/auth/bindings/auth_binding.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/modules/home/bindings/home_binding.dart';
import 'package:fos/app/modules/home/views/home_view.dart';
import 'package:fos/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:fos/app/modules/onboard/views/onboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_UP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: AuthBinding(),
    ),
  ];
}
