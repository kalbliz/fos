import 'package:get/get.dart';

import '../controllers/rider_settings_controller.dart';

class RiderSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderSettingsController>(
      () => RiderSettingsController(),
    );
  }
}
