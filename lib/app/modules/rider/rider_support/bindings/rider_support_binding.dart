import 'package:get/get.dart';

import '../controllers/rider_support_controller.dart';

class RiderSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderSupportController>(
      () => RiderSupportController(),
    );
  }
}
