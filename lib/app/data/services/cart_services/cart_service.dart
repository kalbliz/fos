// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/food_models/get_cart_model.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:get/get.dart';

import 'package:fos/app/data/services/auth_services/auth_services.dart';

class CartServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<CartModel> cartList = <CartModel>[].obs;
  final GeneralDialog generalDialog = GeneralDialog();

  Future addCartDetailToDb(
      {required FoodMenus foodMenus,
      required int quantity,
      required String status}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('cart').doc().set({
      "foodDescription": foodMenus.foodDescription,
      "foodImage": foodMenus.foodImage,
      "foodName": foodMenus.foodName,
      "foodPrice": foodMenus.foodPrice,
      "quantity": quantity,
      "status": status,
      "foodId":foodMenus.id
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

  Future deleteCartDetailsFromDb() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('cart').get().then((snapShot) {
      for (DocumentSnapshot ds in snapShot.docs) {
        ds.reference.delete();
      }
      debugPrint('Cart deleted');
      getCart();
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

  Future getCart() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('cart').get().then((response) async {
      var responseData =
          response.docs.map((e) => CartModel.fromDocumentSnapshot(e)).toList();

      cartList.clear();
      for (var element in responseData) {
        cartList.add(element);
      }
      cartList.sort(((a, b) {
        return Comparable.compare(
            a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      }));
    });
  }
}
