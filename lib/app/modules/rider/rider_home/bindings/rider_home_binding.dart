import 'package:get/get.dart';

import '../controllers/rider_home_controller.dart';

class RiderHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderHomeController>(
      () => RiderHomeController(),
    );
  }
}
