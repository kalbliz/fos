import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/modules/user/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/resturant/create_food/views/create_food_view.dart';
import 'package:fos/app/modules/user/home/controllers/home_controller.dart';
import 'package:fos/app/modules/user/home/views/home_view.dart';
import 'package:fos/app/modules/user/orders/views/orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_home/views/resturant_home_view.dart';
import 'package:fos/app/modules/resturant/resturant_orders/views/resturant_orders_view.dart';
import 'package:fos/app/modules/resturant/resturant_profile/views/resturant_profile_view.dart';
import 'package:fos/app/modules/user/search/views/search_view.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  //TODO: Implement NavController
  final homeController = Get.find<HomeController>();
  final AuthService authService = Get.find<AuthService>();

  final count = 0.obs;
  var tabIndex = 0.obs;
  var userPages = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();

    userPages.add(HomeView());
    userPages.add(SearchView());
    userPages.add(OrdersView());
    userPages.add(AccountsView());
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
