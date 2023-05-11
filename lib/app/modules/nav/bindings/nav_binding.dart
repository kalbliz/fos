import 'package:fos/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:fos/app/modules/create_food/controllers/create_food_controller.dart';
import 'package:fos/app/modules/home/controllers/home_controller.dart';
import 'package:fos/app/modules/orders/controllers/orders_controller.dart';
import 'package:fos/app/modules/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/modules/resturant_orders/controllers/resturant_orders_controller.dart';
import 'package:fos/app/modules/resturant_profile/controllers/resturant_profile_controller.dart';
import 'package:fos/app/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(
      () => NavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<OrdersController>(
      () => OrdersController(),
    );
    Get.lazyPut<AccountsController>(
      () => AccountsController(),
    );
    Get.lazyPut<CreateFoodController>(
      () => CreateFoodController(),
    );
    Get.lazyPut<ResturantHomeController>(
      () => ResturantHomeController(),
    );
    Get.lazyPut<ResturantOrdersController>(
      () => ResturantOrdersController(),
    );
    Get.lazyPut<ResturantProfileController>(
      () => ResturantProfileController(),
    );
  }
}
