import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/modules/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/create_food/views/create_food_view.dart';
import 'package:fos/app/modules/home/controllers/home_controller.dart';
import 'package:fos/app/modules/home/views/home_view.dart';
import 'package:fos/app/modules/orders/views/orders_view.dart';
import 'package:fos/app/modules/resturant_home/views/resturant_home_view.dart';
import 'package:fos/app/modules/resturant_orders/views/resturant_orders_view.dart';
import 'package:fos/app/modules/resturant_profile/views/resturant_profile_view.dart';
import 'package:fos/app/modules/search/views/search_view.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  //TODO: Implement NavController
  final homeController = Get.find<HomeController>();
  final AuthService authService = Get.find<AuthService>();

  final count = 0.obs;
  var tabIndex = 0.obs;
  var userPages = <Widget>[].obs;
  var resturantPages = <Widget>[].obs;
  var riderPages = <Widget>[].obs;
  var userStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint(authService.userState);
    userStatus.value = authService.userState;
    userPages.add(HomeView());
    userPages.add(SearchView());
    userPages.add(OrdersView());
    userPages.add(AccountsView());
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
