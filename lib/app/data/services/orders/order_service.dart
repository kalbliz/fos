import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/cart/get_cart_model.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:fos/app/data/services/cart_services/cart_service.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:get/get.dart';

class OrderServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<OrderModel> orderList = <OrderModel>[].obs;
  int selectedOrderIndex = 0;
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

  Future addOrderDetailToDb2({required OrderModel order}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    final ordersCollection = firebaseFireStore.collection('orders').doc();

    await ordersCollection.set({
      "status": order.status,
      "total": order.total,
      "rider": {
        "name": order.rider?.name,
        "email": order.rider?.email,
        "phone": order.rider?.phone,
        "address": order.rider?.address,
        "photo": order.rider?.photo,
        "active": order.rider?.active,
        "createdAt": order.rider?.createdAt,
        "updatedAt": order.rider?.updatedAt
      },
      "clientName": order.clientName,
      "clientPhoto": order.clientPhoto,
      "clientLocation": order.clientLocation,
      "clientPhoneNumber": order.clientPhoneNumber,
      "resturantName": order.resturantName,
      "resturantId": order.resturantId,
      "cartList": [
        for (var element in Get.find<CartServices>().cartList)
          {
            "foodDescription": element.foodDescription,
            "foodImage": element.foodImage,
            "foodName": element.foodName,
            "foodPrice": element.foodPrice,
            "status": element.status,
            "foodId": element.id,
            "time": DateTime.now(),
            "clientName": element.clientName,
            "clientLocation": element.clientLocation,
            "resturantName": element.resturantName
          },
      ],
      "userId": order.userId,
      "paymentStatus": order.paymentStatus,
      "createdAt": order.createdAt,
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

    await firebaseFireStore
        .collection('orders')
        .where("userId", isEqualTo: authService.userID)
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();

      orderList.clear();
      for (var element in responseData) {
        if (element.userId == authService.userID) {
          orderList.add(element);
        } else {
          null;
        }
      }
    });
  }
}
