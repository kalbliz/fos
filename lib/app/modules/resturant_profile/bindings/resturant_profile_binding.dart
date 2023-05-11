import 'package:get/get.dart';

import '../controllers/resturant_profile_controller.dart';

class ResturantProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResturantProfileController>(
      () => ResturantProfileController(),
    );
  }
}
