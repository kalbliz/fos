import 'package:get/get.dart';

import 'package:fos/app/modules/global/auth/bindings/auth_binding.dart';
import 'package:fos/app/modules/global/auth/views/auth_view.dart';
import 'package:fos/app/modules/global/auth/views/login_view.dart';
import 'package:fos/app/modules/global/auth/views/sign_up_view.dart';
import 'package:fos/app/modules/global/onboard/bindings/onboard_binding.dart';
import 'package:fos/app/modules/global/onboard/views/onboard_view.dart';
import 'package:fos/app/modules/resturant/create_food/bindings/create_food_binding.dart';
import 'package:fos/app/modules/resturant/create_food/views/create_food_view.dart';
import 'package:fos/app/modules/resturant/edit_food/bindings/edit_food_binding.dart';
import 'package:fos/app/modules/resturant/edit_food/views/edit_food_view.dart';
import 'package:fos/app/modules/resturant/resturant_details/bindings/resturant_details_binding.dart';
import 'package:fos/app/modules/resturant/resturant_details/views/resturant_details_view.dart';
import 'package:fos/app/modules/resturant/resturant_home/bindings/resturant_home_binding.dart';
import 'package:fos/app/modules/resturant/resturant_home/views/resturant_home_view.dart';
import 'package:fos/app/modules/resturant/resturant_nav/bindings/resturant_nav_binding.dart';
import 'package:fos/app/modules/resturant/resturant_nav/views/resturant_nav_view.dart';
import 'package:fos/app/modules/resturant/resturant_orders/bindings/resturant_orders_binding.dart';
import 'package:fos/app/modules/resturant/resturant_orders/views/resturant_orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_profile/bindings/resturant_profile_binding.dart';
import 'package:fos/app/modules/resturant/resturant_profile/views/resturant_profile_view.dart';
import 'package:fos/app/modules/resturant/resturant_order_detail/bindings/resturant_order_detail_binding.dart';
import 'package:fos/app/modules/resturant/resturant_order_detail/views/resturant_order_detail_view.dart';
import 'package:fos/app/modules/user/accounts/bindings/accounts_binding.dart';
import 'package:fos/app/modules/user/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/user/cart/bindings/cart_binding.dart';
import 'package:fos/app/modules/user/cart/views/cart_view.dart';
import 'package:fos/app/modules/user/check-out/bindings/check_out_binding.dart';
import 'package:fos/app/modules/user/check-out/views/check_out_view.dart';
import 'package:fos/app/modules/user/food_details/bindings/food_details_binding.dart';
import 'package:fos/app/modules/user/food_details/views/food_details_view.dart';
import 'package:fos/app/modules/user/home/bindings/home_binding.dart';
import 'package:fos/app/modules/user/home/views/home_view.dart';
import 'package:fos/app/modules/user/nav/bindings/nav_binding.dart';
import 'package:fos/app/modules/user/nav/views/nav_view.dart';
import 'package:fos/app/modules/user/order_details/bindings/cart_binding.dart';
import 'package:fos/app/modules/user/order_details/views/order_details_view.dart';
import 'package:fos/app/modules/user/orders/bindings/orders_binding.dart';
import 'package:fos/app/modules/user/orders/views/orders_view.dart';
import 'package:fos/app/modules/user/resturant_list/bindings/resturant_list_binding.dart';
import 'package:fos/app/modules/user/resturant_list/views/resturant_list_view.dart';
import 'package:fos/app/modules/user/search/bindings/search_binding.dart';
import 'package:fos/app/modules/user/search/views/search_view.dart';

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
    GetPage(
      name: _Paths.RESTURANT_ORDER_DETAIL,
      page: () => ResturantOrderDetailView(),
      binding: ResturantOrderDetailBinding(),
    ),
  ];
}
