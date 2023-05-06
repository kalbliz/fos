import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  CartModel(
      {this.foodName,
      this.id,
      this.foodDescription,
      this.foodImage,
      this.foodPrice,
      this.quantity,
      this.status,
      this.time,
      this.foodId});

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final int? quantity;
  final String? status;
  dynamic foodId;
  dynamic id;
  final Timestamp? time;

  factory CartModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      CartModel(
          foodName: json["foodName"],
          foodDescription: json["foodDescription"],
          foodImage: json["foodImage"],
          foodPrice: json["foodPrice"],
          quantity: json['quantity'],
          status: json['status'],
          foodId: json['foodId'],
          time: json["time"],
          id: json.id);

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "status": status,
        "quantity": quantity,
        "foodId": foodId,
        "id": id,
        "time": time
      };
}
