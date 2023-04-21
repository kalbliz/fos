import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final singleChildScrollController = ScrollController();
  final resturantsScrollController = ScrollController();
  final AuthService authService = Get.find<AuthService>();
  final FoodServices foodServices = Get.find<FoodServices>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final pageViewState = ViewState.idle.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getMenus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getMenus() async {
    pageViewState.value = ViewState.busy;
    await foodServices.getFoodMenus();
    await foodServices.getResturants();
    pageViewState.value = ViewState.idle;
  }
}
