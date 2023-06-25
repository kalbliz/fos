import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';
import 'package:fos/app/utilities/dialogues/error_dialog.dart';
import 'package:get/get.dart';

class RiderServices extends GetxService {
  int selectedRiderIndex = 0;
  late List<RiderData> riders = [];
  Future addRiderToUsers(RiderData riderData, User currentUser)async{
    try {
      final CollectionReference ridersCollection =
          FirebaseFirestore.instance.collection('allUsers');

      await ridersCollection.doc(currentUser.uid).set(
        {
        'userID': currentUser.uid,
        'userEmail': riderData.email,
        'userName': riderData.name,
        'userPhoto': riderData.photo,
        'userPhoneNumber': riderData.phone,
        'userAddress': riderData.address,
        'status': 'approved',
        'userState': "rider",
        'earnings': 0.0,
        'lat':0,
        'lng': 0
        }
      );

      print('Rider data saved successfully!');
    } catch (e) {
      print('Error saving rider data: $e');
    }
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
