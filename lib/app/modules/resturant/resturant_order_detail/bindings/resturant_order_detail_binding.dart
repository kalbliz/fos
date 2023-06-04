import 'package:get/get.dart';

import '../controllers/resturant_order_detail_controller.dart';

class ResturantOrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantOrderDetailController>(
      () => ResturantOrderDetailController(),
    );
  }
}
