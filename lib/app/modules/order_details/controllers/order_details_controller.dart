import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/cart/get_cart_model.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/orders/order_service.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement CartController
  final pageState = ViewState.idle.obs;
  final foodServices = Get.find<FoodServices>();
  final orderServices = Get.find<OrderServices>();
  var index = Get.arguments[0]['index'];
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
