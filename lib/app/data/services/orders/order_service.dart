import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/cart/get_cart_model.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:get/get.dart';

class OrderServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<OrderModel> orderList = <OrderModel>[].obs;

  Future addOrderDetailToDb(
      {required CartModel cart, required String status}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .doc()
        .set({"cart": cart, "status": status}).catchError((onError) {
      debugPrint(onError.toString());
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(
              message: onError.toString(),
            );
          });
    });
  }

  Future addOrderDetailToDb2(
      {required List<CartModel> foodMenus,
      required String status,
      required num total}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    final ordersCollection = firebaseFireStore.collection('orders').doc();

    await ordersCollection.set({
      "status": status,
      "userId":authService.userID,
      "total": total,
      "cartList": [
        for (var element in foodMenus)
          {
            "foodDescription": element.foodDescription,
            "foodImage": element.foodImage,
            "foodName": element.foodName,
            "foodPrice": element.foodPrice,
            "status": status,
            "foodId": element.id,
            "time": DateTime.now(),
          }
      ]
    }).catchError((onError) {
      debugPrint(onError.toString());
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return ErrorDialog(
              message: onError.toString(),
            );
          });
    });
  }

  Future getOrderList() async {
    firebaseFireStore = FirebaseFirestore.instance;

    await firebaseFireStore.collection('orders').get().then((response) async {
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();

      orderList.clear();
      for (var element in responseData) {
        orderList.add(element);
        debugPrint(element.toString());
      }
    });
  }
}
