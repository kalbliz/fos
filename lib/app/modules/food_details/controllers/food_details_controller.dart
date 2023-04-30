import 'package:flutter/material.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class FoodDetailsController extends GetxController {
  //TODO: Implement FoodDetailsController
  var id = Get.arguments[0]['id'];
  final foodServices = Get.find<FoodServices>();
  final cartServices = Get.find<CartServices>();
  final count = 0.obs;
  final pageView = ViewState.idle.obs;
  late FoodMenus foodMenus;
  final quantity = 0.obs;
  final status = 'pending'.obs;
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

  Future addToCart() async {
    pageView.value = ViewState.busy;
    foodMenus = FoodMenus(

    );
    await cartServices
        .addCartDetailToDb(
            foodMenus: foodMenus,
            quantity: quantity.value,
            status: status.value)
        .then((response) {
      debugPrint(response.toString());
    });
    pageView.value = ViewState.idle;
  }
}
