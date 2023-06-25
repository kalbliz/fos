import 'package:fos/app/modules/rider/rider_history/controllers/rider_history_controller.dart';
import 'package:fos/app/modules/rider/rider_home/controllers/rider_home_controller.dart';
import 'package:fos/app/modules/rider/rider_profile/controllers/rider_profile_controller.dart';
import 'package:fos/app/modules/rider/rider_support/controllers/rider_support_controller.dart';
import 'package:get/get.dart';

import '../controllers/rider_nav_controller.dart';

class RiderNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderNavController>(
      () => RiderNavController(),
    );
     Get.lazyPut<RiderHomeController>(
      () => RiderHomeController(),
    );
     Get.lazyPut<RiderSupportController>(
      () => RiderSupportController(),
    );
     Get.lazyPut<RiderHistoryController>(
      () => RiderHistoryController(),
    );
     Get.lazyPut<RiderProfileController>(
      () => RiderProfileController(),
    );
    
    
  }
}
