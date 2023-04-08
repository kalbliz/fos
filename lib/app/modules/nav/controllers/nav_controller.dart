import 'package:flutter/material.dart';
import 'package:fos/app/modules/accounts/views/accounts_view.dart';
import 'package:fos/app/modules/home/controllers/home_controller.dart';
import 'package:fos/app/modules/home/views/home_view.dart';
import 'package:fos/app/modules/orders/views/orders_view.dart';
import 'package:fos/app/modules/search/views/search_view.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  //TODO: Implement NavController
  final homeController = Get.find<HomeController>();
  
  final count = 0.obs;
  var tabIndex = 0.obs;
  var pages = <Widget>[].obs;
  @override
  void onInit() {
    super.onInit();
    pages.add( HomeView());
    pages.add( SearchView());
    pages.add( OrdersView());
    pages.add( AccountsView());

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
