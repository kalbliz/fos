import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class ResturantListController extends GetxController {
  //TODO: Implement ResturantListController
final singleChildScrollController = ScrollController();
  final resturantsScrollController = ScrollController();
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final count = 0.obs;
   final pageViewState = ViewState.idle.obs;
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
