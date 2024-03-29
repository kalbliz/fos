import 'package:flutter/material.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/food_services/food_services.dart';
import 'package:fos/app/data/services/rider/rider_service.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/enums/view_state.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResturantHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement ResturantHomeController
  DateFormat formattedDate = DateFormat('yyyy-MM-dd – kk:mm');
  final foodService = Get.find<FoodServices>();
  final riderServices = Get.find<RiderServices>();
  final currentTabIndex = 0.obs;
  late TabController tabController;
  final authService = Get.find<AuthService>();
  final pageViewState = ViewState.idle.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getFood();
    getresturantOrders();
    riderServices.getAllRiders();
    getCategories();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getFood() async {
    pageViewState.value = ViewState.busy;
    await foodService
        .getFoodMenusFromResturant(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    pageViewState.value = ViewState.idle;
  }

  Future getresturantOrders() async {
    pageViewState.value = ViewState.busy;
    // await foodService
    //     .getResturantOrders(resturantName: authService.userName)
    //     .then((value) {})
    //     .catchError((onError) {
    //   ErrorDialog(message: onError.toString());
    // });
    await foodService
        .getAllOrders(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    await foodService
        .getCancelledOrders(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    await foodService
        .getCompletedOrders(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    await foodService
        .getTransitOrders(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    await foodService
        .getPendingOrders(resturantName: authService.userName)
        .then((value) {})
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    pageViewState.value = ViewState.idle;
  }

  Future getCategories() async {
    await foodService.getCategories().then((value) {}).catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
  }

  Future updateOrderStatus(
      {required OrderModel orderModel, required String status}) async {
    pageViewState.value = ViewState.busy;
    await foodService
        .updateOrderState(orderModel: orderModel, status: status)
        .then((value) => getresturantOrders())
        .catchError((onError) {
      ErrorDialog(message: onError.toString());
    });
    pageViewState.value = ViewState.idle;
  }

  String parseTimeStamp(int value) {
    var date = DateTime.fromMillisecondsSinceEpoch(value * 1000);
    var d12 = DateFormat('MM-dd-yyyy, hh:mm a').format(date);
    return d12;
  }
}
