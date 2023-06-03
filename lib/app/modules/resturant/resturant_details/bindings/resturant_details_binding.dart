import 'package:get/get.dart';

import '../controllers/resturant_details_controller.dart';

class ResturantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantDetailsController>(
      () => ResturantDetailsController(),
    );
  }
}
