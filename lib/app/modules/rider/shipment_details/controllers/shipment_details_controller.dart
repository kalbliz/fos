import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:get/get.dart';

class ShipmentDetailsController extends GetxController {
  //TODO: Implement ShipmentDetailsController
  final riderServices = Get.find<RiderServices>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
