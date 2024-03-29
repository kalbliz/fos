import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class RiderHistoryController extends GetxController {
  //TODO: Implement RiderHistoryController
  final riderServices = Get.find<RiderServices>();
  var outputFormat = DateFormat('yyyy-MM-dd');
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
