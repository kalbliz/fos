

import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
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

  CartModel(
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

  factory CartModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) => CartModel(
    id: json.id,
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
