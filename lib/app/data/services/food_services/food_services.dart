import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fos/app/data/models/cart/get_cart_model.dart';
import 'package:fos/app/data/models/categories/get_categories_response.dart';
import 'package:fos/app/data/models/food_models/getFoodResponseModel.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/models/resturants/getResturantsResponseModel.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/data/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class FoodServices extends GetxService {
  late FirebaseFirestore firebaseFireStore;
  final AuthService authService = Get.find<AuthService>();
  final RxList<FoodMenus> foodMenus = <FoodMenus>[].obs;
  final RxList<FoodMenus> similarFood = <FoodMenus>[].obs;
  final RxList<Categories> categories = <Categories>[].obs;
  final RxList<FoodMenus> orderList = <FoodMenus>[].obs;
  final List<UserModel> resturantsList = [];
  final RxList<FoodMenus> foodFromResturant = <FoodMenus>[].obs;
  final RxList<OrderModel> resturantOrdersList = <OrderModel>[].obs;
  final RxList<OrderModel> allOrdersList = <OrderModel>[].obs;
  final RxList<OrderModel> pendingOrdersList = <OrderModel>[].obs;
  final RxList<OrderModel> cancelledOrdersList = <OrderModel>[].obs;
  final RxList<OrderModel> completedOrdersList = <OrderModel>[].obs;
  final RxList<OrderModel> transitOrdersList = <OrderModel>[].obs;
  late RxList<OrderModel> ordersListInUse;
  late int index;
  var selectedFoodIndex = 0;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future saveFoodData({required FoodMenus food}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('foodMenus').doc().set({
      'foodName': food.foodName,
      'foodDescription': food.foodDescription,
      'foodImage': food.foodImage,
      'foodPrice': food.foodPrice,
      'resturantName': food.resturantName,
      'resturantAddress': food.resturantAddress,
      'resturantId': food.resturantId,
      'categories': food.categories
    }).then((value) async {
      getFoodMenus();
    });
  }

  Future createCategory({
    required String categoryName,
    required String categoryDescription,
    required String categoryImage,
  }) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('categories').doc().set({
      'categoryName': categoryName,
      'categoryDescription': categoryDescription,
      'categoryImage': categoryImage,
    }).then((value) async {
      getCategories();
    });
  }

  Future updateFoodData(
      {required String foodName,
      required String foodDescription,
      required String foodImage,
      required String foodId,
      required num foodPrice,
      required String resturantName,
      required String resturantAddress,
      required String resturantId}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('foodMenus').doc(foodId).update({
      'foodName': foodName,
      'foodDescription': foodDescription,
      'foodImage': foodImage,
      'foodPrice': foodPrice,
      'resturantName': resturantName,
      'resturantAddress': resturantAddress,
      'resturantId': resturantId
    }).then((value) async {
      getFoodMenus();
    });
  }

  Future deleteFood({required String foodId}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .doc(foodId)
        .delete()
        .then((value) => getFoodMenus());
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
    }).catchError((onError) {
      debugPrint(onError.toString());
      throw onError;
    });
  }

  Future getSimilarFood({required List<String> category}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('foodMenus')
        .where('categories', arrayContainsAny: category)
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => FoodMenus.fromDocumentSnapshot(e)).toList();

      similarFood.clear();
      for (var element in responseData) {
        similarFood.add(element);
      }
      similarFood.sort(((a, b) {
        return Comparable.compare(
            a.foodName!.toLowerCase(), b.foodName!.toLowerCase());
      }));
    }).catchError((onError) {
      debugPrint(onError.toString());
      throw onError;
    });
  }

  Future getCategories() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('categories')
        .get()
        .then((response) async {
      var responseData =
          response.docs.map((e) => Categories.fromDocumentSnapshot(e)).toList();
      categories.value = responseData;
      print(categories);
      print(categories.length);
    }).catchError((onError) {
      debugPrint(onError.toString());
      throw onError;
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
        .where('resturantName', isEqualTo: resturantName)
        .get()
        .then((response) async {
      // debugPrint(response.docs.toString());
      var responseData =
          response.docs.map((e) => FoodMenus.fromDocumentSnapshot(e)).toList();
      foodFromResturant.value = responseData;
    }).catchError((onError) {
      debugPrint(onError.toString());
      throw onError;
    });
  }

  Future getResturants() async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('allUsers').get().then((response) async {
      var responseData =
          response.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
      resturantsList.clear();
      for (var element in responseData) {
        if (element.userState == 'resturant') {
          resturantsList.add(element);
        } else {
          null;
        }
      }
      resturantsList.sort(((a, b) {
        return Comparable.compare(
            a.userName!.toLowerCase(), b.userName!.toLowerCase());
      }));
    }).catchError((onError) {
      throw onError;
    });
    ;
  }

  // Future getResturantOrders({required String resturantName}) async {
  //   firebaseFireStore = FirebaseFirestore.instance;
  //   await firebaseFireStore
  //       .collection('orders')
  //       .where('resturantName', isEqualTo: resturantName)
  //       .get()
  //       .then((response) async {
  //     debugPrint(response.docs.toString());

  //     var responseData =
  //         response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
  //     for (var element in responseData) {
  //       resturantOrdersList.add(element);
  //       element.status == 'success'
  //           ? completedOrdersList.add(element)
  //           : pendingOrdersList.add(element);
  //     }
  //   }).catchError((onError) {
  //     throw onError;
  //   });
  // }
  Future updateOrderState(
      {required OrderModel orderModel, required String status}) async {
    debugPrint(orderModel.id);
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .doc(orderModel.id)
        .update({'status': status})
        .then((response) async {})
        .catchError((onError) {
          throw onError;
        });
  }

  Future updateOrderRider(
      {required OrderModel orderModel, required RiderData rider}) async {
    debugPrint(orderModel.id);
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .doc(orderModel.id)
        .update({
          'rider': {
            "name": rider.name,
            "email": rider.email,
            "phone": rider.phone,
            "address": rider.address,
            "photo": rider.photo,
            "active": rider.active,
            "createdAt": rider.createdAt,
            "updatedAt": rider.updatedAt
          }
        })
        .then((response) async {})
        .catchError((onError) {
          throw onError;
        });
  }

  Future getPendingOrders({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .where('resturantName', isEqualTo: resturantName)
        .where('status', isEqualTo: 'pending')
        .get()
        .then((response) async {
      // debugPrint(response.docs.toString());
      pendingOrdersList.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      responseData.sort(
          (a, b) => b.cartList!.first.time!.compareTo(a.cartList!.first.time!));
      pendingOrdersList.value = responseData;
    }).catchError((onError) {
      throw onError;
    });
  }

  Future getCompletedOrders({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .where('resturantName', isEqualTo: resturantName)
        .where('status', isEqualTo: 'completed')
        .get()
        .then((response) async {
      // debugPrint(response.docs.toString());
      completedOrdersList.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      responseData.sort(
          (a, b) => b.cartList!.first.time!.compareTo(a.cartList!.first.time!));
      completedOrdersList.value = responseData;
    }).catchError((onError) {
      throw onError;
    });
  }

  Future getTransitOrders({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .where('resturantName', isEqualTo: resturantName)
        .where('status', isEqualTo: 'transit')
        .get()
        .then((response) async {
      // debugPrint(response.docs.toString());
      transitOrdersList.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      responseData.sort(
          (a, b) => b.cartList!.first.time!.compareTo(a.cartList!.first.time!));
      transitOrdersList.value = responseData;
    }).catchError((onError) {
      throw onError;
    });
  }

  Future getCancelledOrders({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .where('resturantName', isEqualTo: resturantName)
        .where('status', isEqualTo: 'cancelled')
        .get()
        .then((response) async {
      // debugPrint(response.docs.toString());
      cancelledOrdersList.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      responseData.sort(
          (a, b) => b.cartList!.first.time!.compareTo(a.cartList!.first.time!));
      cancelledOrdersList.value = responseData;
    }).catchError((onError) {
      throw onError;
    });
  }

  Future getAllOrders({required String resturantName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore
        .collection('orders')
        .where('resturantName', isEqualTo: resturantName)
        .get()
        .then((response) async {
      allOrdersList.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      responseData.sort(
          (a, b) => b.cartList!.first.time!.compareTo(a.cartList!.first.time!));
      allOrdersList.value = responseData;
    }).catchError((onError) {
      throw onError;
    });
  }
}
