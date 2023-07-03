import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/orderModels/get_order_response.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:get/get.dart';

class RiderServices extends GetxService {
  int selectedRiderIndex = 0;
  int selectedHistoryIndex = 0;
  final isRiderInTransit = false.obs;
  late List<RiderData> riders = [];
  late List<OrderModel> riderOrders = [];
  late RxList<OrderModel> riderHistory = <OrderModel>[].obs;
  late FirebaseFirestore firebaseFireStore;
  int selectedOrderIndex = 0;
  Future addRiderToUsers(RiderData riderData, User currentUser) async {
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('allUsers');

      await ridersCollection.doc(currentUser.uid).set({
        'userID': currentUser.uid,
        'userEmail': riderData.email,
        'userName': riderData.name,
        'userPhoto': riderData.photo,
        'userPhoneNumber': riderData.phone,
        'userAddress': riderData.address,
        'status': 'approved',
        'userState': "rider",
        'earnings': 0.0,
        'lat': 0,
        'lng': 0
      });

      print('Rider data saved successfully!');
    } catch (e) {
      print('Error saving rider data: $e');
    }
  }

  Future getRiderOrders({required String riderName}) async {
    firebaseFireStore = FirebaseFirestore.instance;
    debugPrint(riderName);
    await firebaseFireStore.collection('orders').get().then((response) async {
      riderOrders.clear();
      riderHistory.clear();
      var responseData =
          response.docs.map((e) => OrderModel.fromDocumentSnapShot(e)).toList();
      for (var element in responseData) {
        if (element.rider!.name == riderName) {
          riderHistory.value.add(element);
        }
        if (element.rider!.name == riderName && element.status != "completed") {
          riderOrders.add(element);
        }
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  Future updateRiderOrders(
      {required String orderId, required String status}) async {
    firebaseFireStore = FirebaseFirestore.instance;

    await firebaseFireStore
        .collection('orders')
        .doc(orderId)
        .update({"status": status})
        .then((value) {})
        .catchError((onError) {
          throw onError;
        });
  }

  Future rejectOrder({required String orderId, required String status}) async {
    firebaseFireStore = FirebaseFirestore.instance;

    await firebaseFireStore
        .collection('orders')
        .doc(orderId)
        .update({
          "status": status,
          'rider': {
            "name": null,
            "email": null,
            "phone": null,
            "address": null,
            "photo": null,
            "active": null,
            "createdAt": null,
            "updatedAt": null
          }
        })
        .then((value) {})
        .catchError((onError) {
          throw onError;
        });
  }

  Future saveRider(RiderData riderData) async {
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('riders');

      await ridersCollection.doc().set(riderData.toJson());

      print('Rider data saved successfully!');
    } catch (e) {
      print('Error saving rider data: $e');
    }
  }

  Future getAllRiders() async {
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('riders');

      await ridersCollection.get().then((snapshot) {
        riders = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return RiderData.fromJson(data);
        }).toList();
      });
    } catch (e) {
      print('Error retrieving riders data: $e');
      return [];
    }
  }
}
