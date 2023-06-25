import 'package:get/get.dart';

import '../controllers/rider_profile_controller.dart';

class RiderProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderProfileController>(
      () => RiderProfileController(),
    );
  }
}
