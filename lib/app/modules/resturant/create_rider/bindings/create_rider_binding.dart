import 'package:get/get.dart';

import '../controllers/create_rider_controller.dart';

class CreateRiderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRiderController>(
      () => CreateRiderController(),
    );
  }
}
