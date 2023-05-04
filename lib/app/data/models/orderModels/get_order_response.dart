// To parse this JSON data, do
//
//     final OrderModel = OrderModelFromMap(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// List<OrderModel> OrderModelFromMap(String str) =>
//     List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromMap(x)));

// String OrderModelToMap(List<OrderModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class OrderModel {
  OrderModel({
    this.foodName,
    this.foodDescription,
    this.foodImage,
    this.foodPrice,
    this.resturantName,
    this.resturantAdress,
    this.deliveryStatus,
    this.clientName,
  });

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final String? resturantName;
  final String? resturantAdress;
  final String? deliveryStatus;
  final String? clientName;

  

  factory OrderModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      OrderModel(
        foodName: json["foodName"],
        foodDescription: json["foodDescription"],
        foodImage: json["foodImage"],
        foodPrice: json["foodPrice"],
        resturantName: json["resturantName"],
        resturantAdress: json["resturantAdress"],
        deliveryStatus: json["deliveryStatus"],
        clientName: json["clientName"],
      );

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "resturantName": resturantName,
        "resturantAdress": resturantAdress,
        "deliveryStatus": deliveryStatus,
        "clientName": clientName,
      };
}
