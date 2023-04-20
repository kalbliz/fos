import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:get/get.dart';

class FoodDetailsController extends GetxController {
  //TODO: Implement FoodDetailsController
  var index = Get.arguments[0]['index'];
  final  foodServices = Get.find<FoodServices>().foodMenus;
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
  void onClose() {}
  void increment() => count.value++;
}
