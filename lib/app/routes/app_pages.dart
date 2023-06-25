import 'package:fos/app/modules/rider/rider_profile/bindings/rider_profile_binding.dart';
import 'package:fos/app/modules/rider/rider_profile/views/rider_profile_view.dart';
import 'package:fos/app/modules/rider/rider_support/bindings/rider_support_binding.dart';
import 'package:fos/app/modules/rider/rider_support/views/rider_support_view.dart';
import 'package:get/get.dart';

import '../modules/global/auth/bindings/auth_binding.dart';
import '../modules/global/auth/views/auth_view.dart';
import '../modules/global/auth/views/login_view.dart';
import '../modules/global/auth/views/sign_up_view.dart';
import '../modules/global/onboard/bindings/onboard_binding.dart';
import '../modules/global/onboard/views/onboard_view.dart';
import '../modules/resturant/assign_rider/bindings/assign_rider_binding.dart';
import '../modules/resturant/assign_rider/views/assign_rider_view.dart';
import '../modules/resturant/create_food/bindings/create_food_binding.dart';
import '../modules/resturant/create_food/views/create_food_view.dart';
import '../modules/resturant/create_rider/bindings/create_rider_binding.dart';
import '../modules/resturant/create_rider/views/create_rider_view.dart';
import '../modules/resturant/edit_food/bindings/edit_food_binding.dart';
import '../modules/resturant/edit_food/views/edit_food_view.dart';
import '../modules/resturant/resturant_details/bindings/resturant_details_binding.dart';
import '../modules/resturant/resturant_details/views/resturant_details_view.dart';
import '../modules/resturant/resturant_home/bindings/resturant_home_binding.dart';
import '../modules/resturant/resturant_home/views/resturant_home_view.dart';
import '../modules/resturant/resturant_nav/bindings/resturant_nav_binding.dart';
import '../modules/resturant/resturant_nav/views/resturant_nav_view.dart';
import '../modules/resturant/resturant_order_detail/bindings/resturant_order_detail_binding.dart';
import '../modules/resturant/resturant_order_detail/views/resturant_order_detail_view.dart';
import '../modules/resturant/resturant_orders/bindings/resturant_orders_binding.dart';
import '../modules/resturant/resturant_orders/views/resturant_orders_view.dart';
import '../modules/resturant/resturant_profile/bindings/resturant_profile_binding.dart';
import '../modules/resturant/resturant_profile/views/resturant_profile_view.dart';
import '../modules/resturant/rider/bindings/rider_binding.dart';
import '../modules/resturant/rider/views/rider_view.dart';
import '../modules/resturant/rider_details/bindings/rider_details_binding.dart';
import '../modules/resturant/rider_details/views/rider_details_view.dart';
import '../modules/rider/rider_history/bindings/rider_history_binding.dart';
import '../modules/rider/rider_history/views/rider_history_view.dart';
import '../modules/rider/rider_home/bindings/rider_home_binding.dart';
import '../modules/rider/rider_home/views/rider_home_view.dart';
import '../modules/rider/rider_nav/bindings/rider_nav_binding.dart';
import '../modules/rider/rider_nav/views/rider_nav_view.dart';

import '../modules/user/accounts/bindings/accounts_binding.dart';
import '../modules/user/accounts/views/accounts_view.dart';
import '../modules/user/cart/bindings/cart_binding.dart';
import '../modules/user/cart/views/cart_view.dart';
import '../modules/user/check-out/bindings/check_out_binding.dart';
import '../modules/user/check-out/views/check_out_view.dart';
import '../modules/user/food_details/bindings/food_details_binding.dart';
import '../modules/user/food_details/views/food_details_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/nav/bindings/nav_binding.dart';
import '../modules/user/nav/views/nav_view.dart';
import '../modules/user/order_details/bindings/cart_binding.dart';
import '../modules/user/order_details/views/order_details_view.dart';
import '../modules/user/orders/bindings/orders_binding.dart';
import '../modules/user/orders/views/orders_view.dart';
import '../modules/user/resturant_list/bindings/resturant_list_binding.dart';
import '../modules/user/resturant_list/views/resturant_list_view.dart';
import '../modules/user/search/bindings/search_binding.dart';
import '../modules/user/search/views/search_view.dart';

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
    GetPage(
      name: _Paths.RIDER,
      page: () => RiderView(),
      binding: RiderBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_DETAILS,
      page: () => RiderDetailsView(),
      binding: RiderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_RIDER,
      page: () => CreateRiderView(),
      binding: CreateRiderBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGN_RIDER,
      page: () => const AssignRiderView(),
      binding: AssignRiderBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_NAV,
      page: () => const RiderNavView(),
      binding: RiderNavBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_HOME,
      page: () => const RiderHomeView(),
      binding: RiderHomeBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_HISTORY,
      page: () => const RiderHistoryView(),
      binding: RiderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_SUPPORT,
      page: () => const RiderSupportView(),
      binding: RiderSupportBinding(),
    ),
    GetPage(
      name: _Paths.RIDER_PROFILE,
      page: () => const RiderProfileView(),
      binding: RiderProfileBinding(),
    ),
  ];
}
