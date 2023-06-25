import 'package:get/get.dart';

import '../controllers/rider_history_controller.dart';

class RiderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderHistoryController>(
      () => RiderHistoryController(),
    );
  }
}
