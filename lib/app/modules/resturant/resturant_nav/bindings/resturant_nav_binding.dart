import 'package:fos/app/modules/resturant/create_food/controllers/create_food_controller.dart';
import 'package:fos/app/modules/resturant/resturant_home/controllers/resturant_home_controller.dart';
import 'package:fos/app/modules/resturant/resturant_orders/controllers/resturant_orders_controller.dart';
import 'package:fos/app/modules/resturant/resturant_profile/controllers/resturant_profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/resturant_nav_controller.dart';

class ResturantNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantNavController>(
      () => ResturantNavController(),
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
