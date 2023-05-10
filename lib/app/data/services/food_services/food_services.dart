import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/resturants/getResturantsResponseModel.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class FoodServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<FoodMenus> foodMenus = <FoodMenus>[].obs;
  final RxList<FoodMenus> orderList = <FoodMenus>[].obs;
  final List<ResturantModel> resturantsList = [];
  final RxList<FoodMenus> foodFromResturant = <FoodMenus>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future saveFoodData({
    required String foodName,
    required String foodDescription,
    required String foodImage,
    required num foodPrice,
    required String resturantName,
    required String resturantAddress,
  }) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('foodMenus').doc().set({
      'foodName': foodName,
      'foodDescription': foodDescription,
      'foodImage': foodImage,
      'foodPrice': foodPrice,
      'resturantName': resturantName,
      'resturantAddress': resturantAddress
    }).then((value) async {
      getFoodMenus();
    });
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

  Future deleteFoodMenus(String id) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .doc(id)
        .delete()
        .catchError((onError) {
      debugPrint(onError.toString());
    });
    getFoodMenus();
  }

  Future getFoodMenusFromResturant({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .where('sellerName', isEqualTo: resturantName)
        .get()
        .then((response) async {
      debugPrint(response.docs.toString());
      var responseData =
          response.docs.map((e) => FoodMenus.fromDocumentSnapshot(e)).toList();
      foodFromResturant.value = responseData;
    });
  }

  Future getResturants() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('sellers').get().then((response) async {
      var responseData = response.docs
          .map((e) => ResturantModel.fromDocumentSnapshot(e))
          .toList();
      resturantsList.clear();
      for (var element in responseData) {
        resturantsList.add(element);
      }
      resturantsList.sort(((a, b) {
        return Comparable.compare(
            a.userName!.toLowerCase(), b.userName!.toLowerCase());
      }));
    });
  }
}
