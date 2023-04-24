import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  //TODO: Implement OrdersController
  final pageState = ViewState.idle.obs;
  final foodServices = Get.find<FoodServices>();
  final RxList<FoodMenus> orderMenu = <FoodMenus>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    orderMenu.value = foodServices.foodMenus;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future deleteOrder(String id) async {
    pageState.value = ViewState.busy;
    await foodServices.deleteFoodMenus(id);
    debugPrint('delete successful');
    pageState.value = ViewState.idle;
  }
}
