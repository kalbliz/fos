import 'package:get/get.dart';

import 'package:fos/app/modules/accounts/bindings/accounts_binding.dart';
import 'package:fos/app/modules/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/auth/bindings/auth_binding.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/modules/auth/views/login_view.dart';
import 'package:fos/app/modules/auth/views/sign_up_view.dart';
import 'package:fos/app/modules/cart/bindings/cart_binding.dart';
import 'package:fos/app/modules/cart/views/cart_view.dart';
import 'package:fos/app/modules/check-out/bindings/check_out_binding.dart';
import 'package:fos/app/modules/check-out/views/check_out_view.dart';
import 'package:fos/app/modules/create_food/bindings/create_food_binding.dart';
import 'package:fos/app/modules/create_food/views/create_food_view.dart';
import 'package:fos/app/modules/edit_food/bindings/edit_food_binding.dart';
import 'package:fos/app/modules/edit_food/views/edit_food_view.dart';
import 'package:fos/app/modules/food_details/bindings/food_details_binding.dart';
import 'package:fos/app/modules/food_details/views/food_details_view.dart';
import 'package:fos/app/modules/home/bindings/home_binding.dart';
import 'package:fos/app/modules/home/views/home_view.dart';
import 'package:fos/app/modules/nav/bindings/nav_binding.dart';
import 'package:fos/app/modules/nav/views/nav_view.dart';
import 'package:fos/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:fos/app/modules/onboard/views/onboard_view.dart';
import 'package:fos/app/modules/order_details/bindings/cart_binding.dart';
import 'package:fos/app/modules/order_details/views/order_details_view.dart';
import 'package:fos/app/modules/orders/bindings/orders_binding.dart';
import 'package:fos/app/modules/orders/views/orders_view.dart';
import 'package:fos/app/modules/resturant_details/bindings/resturant_details_binding.dart';
import 'package:fos/app/modules/resturant_details/views/resturant_details_view.dart';
import 'package:fos/app/modules/resturant_home/bindings/resturant_home_binding.dart';
import 'package:fos/app/modules/resturant_home/views/resturant_home_view.dart';
import 'package:fos/app/modules/resturant_list/bindings/resturant_list_binding.dart';
import 'package:fos/app/modules/resturant_list/views/resturant_list_view.dart';
import 'package:fos/app/modules/resturant_nav/bindings/resturant_nav_binding.dart';
import 'package:fos/app/modules/resturant_nav/views/resturant_nav_view.dart';
import 'package:fos/app/modules/resturant_orders/bindings/resturant_orders_binding.dart';
import 'package:fos/app/modules/resturant_orders/views/resturant_orders_view.dart';
import 'package:fos/app/modules/resturant_profile/bindings/resturant_profile_binding.dart';
import 'package:fos/app/modules/resturant_profile/views/resturant_profile_view.dart';
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
    GetPage(
      name: _Paths.FOOD_DETAILS,
      page: () => FoodDetailsView(),
      binding: FoodDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_DETAILS,
      page: () => ResturantDetailsView(),
      binding: ResturantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_LIST,
      page: () => ResturantListView(),
      binding: ResturantListBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_FOOD,
      page: () => CreateFoodView(),
      binding: CreateFoodBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => CheckOutView(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => OrderDetailsViews(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_HOME,
      page: () => ResturantHomeView(),
      binding: ResturantHomeBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_ORDERS,
      page: () => ResturantOrdersView(),
      binding: ResturantOrdersBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_PROFILE,
      page: () => ResturantProfileView(),
      binding: ResturantProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_FOOD,
      page: () => EditFoodView(),
      binding: EditFoodBinding(),
    ),
    GetPage(
      name: _Paths.RESTURANT_NAV,
      page: () => ResturantNavView(),
      binding: ResturantNavBinding(),
    ),
  ];
}
