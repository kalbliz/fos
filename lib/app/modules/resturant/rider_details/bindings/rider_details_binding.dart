import 'package:get/get.dart';

import '../controllers/rider_details_controller.dart';

class RiderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderDetailsController>(
      () => RiderDetailsController(),
    );
  }
}
