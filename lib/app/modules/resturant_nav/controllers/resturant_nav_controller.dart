import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/modules/create_food/views/create_food_view.dart';
import 'package:fos/app/modules/resturant_home/views/resturant_home_view.dart';
import 'package:fos/app/modules/resturant_orders/views/resturant_orders_view.dart';
import 'package:fos/app/modules/resturant_profile/views/resturant_profile_view.dart';
import 'package:get/get.dart';

class ResturantNavController extends GetxController {
  //TODO: Implement ResturantNavController


  final AuthService authService = Get.find<AuthService>();

  final count = 0.obs;
  var tabIndex = 0.obs;

  var resturantPages = <Widget>[].obs;


  @override
  void onInit() {
    super.onInit();
 
    resturantPages.add(ResturantHomeView());
    resturantPages.add(CreateFoodView());
    resturantPages.add(ResturantOrdersView());
    resturantPages.add(ResturantProfileView());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    Get.log(tabIndex.value.toString());
    update();
  }
}
