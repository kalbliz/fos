import 'package:get/get.dart';

import '../controllers/resturant_orders_controller.dart';

class ResturantOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantOrdersController>(
      () => ResturantOrdersController(),
    );
  }
}
