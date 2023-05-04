import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/food_models/get_cart_model.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController
  final pageState = ViewState.idle.obs;
  final foodServices = Get.find<FoodServices>();
  final cartServices = Get.find<CartServices>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCart();
  
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getCart() async {
    pageState.value = ViewState.busy;
    await cartServices.getCart();

    pageState.value = ViewState.idle;
  }

  Future deleteOrder(String id) async {
    pageState.value = ViewState.busy;
    await foodServices.deleteFoodMenus(id);
    debugPrint('delete successful');
    pageState.value = ViewState.idle;
  }
}
