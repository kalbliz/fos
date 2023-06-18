// To parse this JSON data, do
//
//     final OrderModel = OrderModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fos/app/data/models/rider/rider_response.dart';

OrderModel OrderModelFromJson(String str) =>
    OrderModel.fromDocumentSnapShot(json.decode(str));

String OrderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String? status;
  int? total;
  RiderData? rider;
  String? clientName;
  String? clientPhoto;
  String? clientLocation;
  String? clientPhoneNumber;
  String? resturantName;
  String? resturantId;
  List<CartList>? cartList;
  final String? userId;
  dynamic id;

  OrderModel({
    this.status,
    this.total,
    this.cartList,
    this.rider,
    this.userId,
    this.clientPhoneNumber,
    this.resturantId,
    this.resturantName,
    this.clientPhoto,
    this.id,
    this.clientLocation,
    this.clientName,
  });

  factory OrderModel.fromDocumentSnapShot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      OrderModel(
          status: json["status"],
          id: json.id,
          rider:
              json['rider'] != null ? RiderData.fromJson(json['rider']) : null,
          clientPhoneNumber: json['clientPhoneNumber'],
          clientPhoto: json['clientPhoto'],
          clientLocation: json['clientLocation'],
          clientName: json['clientName'],
          resturantId: json['resturantId'],
          resturantName: json['resturantName'],
          total: json["total"],
          cartList: json["cartList"] == null
              ? []
              : List<CartList>.from(
                  json["cartList"]!.map((x) => CartList.from(x))),
          userId: json['userId']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "cartList": cartList == null
            ? []
            : List<dynamic>.from(cartList!.map((x) => x.toJson())),
        "userId": userId,
        "clientName": clientName,
        "clientLocation": clientLocation,
        "clientPhoneNumber": clientPhoneNumber,
        "resturantName": resturantName,
        "resturantId": resturantId,
        "clientPhoto": clientPhoto,
        "rider": rider
      };
}

class CartList {
  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final int? quantity;
  final String? status;
  final String? clientName;
  final String? clientLocation;
  final String? resturantName;
  dynamic foodId;
  dynamic id;
  final Timestamp? time;

  CartList(
      {this.foodName,
      this.id,
      this.clientLocation,
      this.clientName,
      this.foodDescription,
      this.foodImage,
      this.foodPrice,
      this.quantity,
      this.resturantName,
      this.status,
      this.time,
      this.foodId});

  factory CartList.from(Map<String, dynamic> json) => CartList(
      foodName: json["foodName"],
      foodDescription: json["foodDescription"],
      foodImage: json["foodImage"],
      foodPrice: json["foodPrice"],
      quantity: json['quantity'],
      status: json['status'],
      foodId: json['foodId'],
      time: json['time'],
      resturantName: json['resturantName'],
      clientLocation: json['clientLocation'],
      clientName: json['clientName']);

  Map<String, dynamic> toJson() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "status": status,
        "quantity": quantity,
        "foodId": foodId,
        "id": id,
        "time": time,
        "clientName": clientName,
        "clientLocation": clientLocation,
        "resturantName": resturantName,
      };
}
