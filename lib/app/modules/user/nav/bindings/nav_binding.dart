import 'package:fos/app/modules/user/accounts/controllers/accounts_controller.dart';
import 'package:fos/app/modules/resturant/create_food/controllers/create_food_controller.dart';
import 'package:fos/app/modules/user/home/controllers/home_controller.dart';
import 'package:fos/app/modules/user/orders/controllers/orders_controller.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/modules/resturant/resturant_orders/controllers/resturant_orders_controller.dart';
import 'package:fos/app/modules/resturant/resturant_profile/controllers/resturant_profile_controller.dart';
import 'package:fos/app/modules/user/search/controllers/search_controller.dart';
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

  }
}
