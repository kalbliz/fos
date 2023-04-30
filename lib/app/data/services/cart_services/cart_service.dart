// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:get/get.dart';

import 'package:fos/app/data/services/auth_services/auth_services.dart';

class CartServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<FoodMenus> cartList = <FoodMenus>[].obs;
  final GeneralDialog generalDialog = GeneralDialog();
  Future addCartDetailToDb(
      {required FoodMenus foodMenus,
      required int quantity,
      required String status}) async {
    await firebaseFireStore.collection('cart').doc().set({
      "foodDescription": foodMenus.foodDescription,
      "foodImage": foodMenus.foodImage,
      "foodName": foodMenus.foodName,
      "foodPrice": foodMenus.foodPrice,
      "quantity": quantity,
      "status": status
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
}
