import 'package:cloud_firestore/cloud_firestore.dart';

class FoodMenus {
  FoodMenus({
    this.foodName,
    this.foodDescription,
    this.foodImage,
    this.foodPrice,
  });

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final String? foodPrice;

  factory FoodMenus.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      FoodMenus(
        foodName: json["foodName"],
        foodDescription: json["foodDescription"],
        foodImage: json["foodImage"],
        foodPrice: json["foodPrice"],
      );

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
      };
}
