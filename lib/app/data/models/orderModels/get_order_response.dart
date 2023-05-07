// To parse this JSON data, do
//
//     final OrderModel = OrderModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

OrderModel OrderModelFromJson(String str) =>
    OrderModel.fromDocumentSnapShot(json.decode(str));

String OrderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String? status;
  int? total;
  List<CartList>? cartList;
  dynamic id;

  OrderModel({this.status, this.total, this.cartList, this.id});

  factory OrderModel.fromDocumentSnapShot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      OrderModel(
        status: json["status"],
        id: json.id,
        total: json["total"],
        cartList: json["cartList"] == null
            ? []
            : List<CartList>.from(
                json["cartList"]!.map((x) => CartList.from(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "cartList": cartList == null
            ? []
            : List<dynamic>.from(cartList!.map((x) => x.toJson())),
      };
}

class CartList {
  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final int? quantity;
  final String? status;
  dynamic foodId;
  dynamic id;
  final String? userId;
  final Timestamp? time;

  CartList(
      {this.foodName,
      this.id,
      this.userId,
      this.foodDescription,
      this.foodImage,
      this.foodPrice,
      this.quantity,
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
        userId: json['userId']
      );

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
        "userId":userId
      };
}
