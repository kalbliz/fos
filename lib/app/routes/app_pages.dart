import 'package:get/get.dart';

import 'package:fos/app/modules/accounts/bindings/accounts_binding.dart';
import 'package:fos/app/modules/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/auth/bindings/auth_binding.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/modules/auth/views/login_view.dart';
import 'package:fos/app/modules/auth/views/sign_up_view.dart';
import 'package:fos/app/modules/home/bindings/home_binding.dart';
import 'package:fos/app/modules/home/views/home_view.dart';
import 'package:fos/app/modules/nav/bindings/nav_binding.dart';
import 'package:fos/app/modules/nav/views/nav_view.dart';
import 'package:fos/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:fos/app/modules/onboard/views/onboard_view.dart';
import 'package:fos/app/modules/orders/bindings/orders_binding.dart';
import 'package:fos/app/modules/orders/views/orders_view.dart';
import 'package:fos/app/modules/search/bindings/search_binding.dart';
import 'package:fos/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
    GetPage(
      name: _Paths.NAV,
      page: () => NavView(),
      binding: NavBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNTS,
      page: () => AccountsView(),
      binding: AccountsBinding(),
    ),
  ];
}
