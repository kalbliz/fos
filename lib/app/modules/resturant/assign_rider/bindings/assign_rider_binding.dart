import 'package:get/get.dart';

import '../controllers/assign_rider_controller.dart';

class AssignRiderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignRiderController>(
      () => AssignRiderController(),
    );
  }
}
