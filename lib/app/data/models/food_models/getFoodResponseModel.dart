// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class FoodMenus {
  FoodMenus({
    this.foodName,
    this.id,
    this.foodDescription,
    this.foodImage,
    this.foodPrice,
    this.resturantId,
    this.resturantName,
    this.resturantAddress,
  });

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final String? resturantName;
  dynamic id;
  final String? resturantId;
  final String? resturantAddress;

  factory FoodMenus.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      FoodMenus(
          foodName: json["foodName"],
          foodDescription: json["foodDescription"],
          foodImage: json["foodImage"],
          foodPrice: json["foodPrice"],
          resturantAddress: json["resturantAddress"],
          resturantName: json['resturantName'],
          resturantId: json['resturantId'],
          id: json.id);

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "resturantName": resturantName,
        "resturantAddress": resturantAddress,
        "id": id,
        "resturantId": resturantId
      };
}
