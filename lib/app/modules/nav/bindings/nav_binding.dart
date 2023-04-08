import 'package:fos/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:fos/app/modules/home/controllers/home_controller.dart';
import 'package:fos/app/modules/orders/controllers/orders_controller.dart';
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
  }
}
