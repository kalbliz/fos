import 'package:get/get.dart';

import '../controllers/rider_personal_details_controller.dart';

class RiderPersonalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderPersonalDetailsController>(
      () => RiderPersonalDetailsController(),
    );
  }
}
