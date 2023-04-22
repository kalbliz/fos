import 'package:get/get.dart';

import '../controllers/resturant_list_controller.dart';

class ResturantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantListController>(
      () => ResturantListController(),
    );
  }
}
