import 'package:flutter/foundation.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:get/get.dart';

class ResturantOrderDetailController extends GetxController {
  //TODO: Implement ResturantOrderDetailController
  final foodService = Get.find<FoodServices>();
  final argument = Get.arguments[0]['orderList'];
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
