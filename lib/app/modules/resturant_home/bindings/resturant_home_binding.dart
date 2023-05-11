import 'package:get/get.dart';

import '../controllers/resturant_home_controller.dart';

class ResturantHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantHomeController>(
      () => ResturantHomeController(),
    );
  }
}
