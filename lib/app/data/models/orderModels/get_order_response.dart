// To parse this JSON data, do
//
//     final OrderModel = OrderModelFromMap(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fos/app/data/models/cart/get_cart_model.dart';

// List<OrderModel> OrderModelFromMap(String str) =>
//     List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromMap(x)));

// String OrderModelToMap(List<OrderModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class OrderModel {
  OrderModel({
    this.cartList,
    this.status,
    this.id,
    this.total,
  });

  final List<CartModel>? cartList;
  final String? status;
  dynamic id;
  final num? total;

  factory OrderModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      OrderModel(total: json["total"], id: json.id, status: json["status"]);

  Map<String, dynamic> toMap() =>
      {"cartList": cartList, "status": status, "total": total};
}
