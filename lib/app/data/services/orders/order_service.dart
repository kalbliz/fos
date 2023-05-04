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
      {required FoodMenus foodMenus, required String status}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('orders').doc().set({
      "foodDescription": foodMenus.foodDescription,
      "foodImage": foodMenus.foodImage,
      "foodPrice": foodMenus.foodPrice,
      "resturantName": foodMenus.resturantName,
      "resturantAdress": foodMenus.resturantAddress,
      "deliveryStatus": status,
      "clientName": authService.userName
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
          response.docs.map((e) => OrderModel.fromDocumentSnapshot(e)).toList();

      orderList.clear();
      for (var element in responseData) {
        orderList.add(element);
      }
      orderList.sort(((a, b) {
        return Comparable.compare(
            a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      }));
    });
  }
}
