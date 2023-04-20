import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class FoodServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final List<FoodMenus> foodMenus = [];
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future getFoodMenus() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => FoodMenus.fromDocumentSnapshot(e)).toList();
      foodMenus.clear();
      for (var element in responseData) {
        foodMenus.add(element);
      }
      foodMenus.sort(((a, b) {
        return Comparable.compare(
            a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      }));
    });
  }

  Future getFoodMenusFromResturant({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .where('sellerName', isEqualTo: resturantName)
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => FoodMenus.fromDocumentSnapshot(e)).toList();
      //clear list
      // foodMenus.clear();
      for (var element in responseData) {
        //add to list
        // foodMenus.add(element);
      }
      //sort list
      // foodMenus.sort(((a, b) {
      //   return Comparable.compare(
      //       a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      // }));
    });
  }
}
