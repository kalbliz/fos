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
      this.clientName,
      this.resturantName,
      this.resturantId,
      this.clientLocation,
      this.time,
      this.foodId});

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final String? clientName;
  final String? clientLocation;
  final String? resturantName;
  final String? resturantId;
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
          clientLocation: json["clientLocation"],
          resturantName: json['resturantName'],
          resturantId: json['resturantId'],
          clientName: json["clientName"],
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
        "time": time,
        "clientName": clientName,
        "clientLocation": clientLocation,
        "resturantName": resturantName,
        "resturantId": resturantId,
      };
}
