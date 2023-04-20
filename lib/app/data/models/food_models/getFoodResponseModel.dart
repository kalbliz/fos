import 'package:cloud_firestore/cloud_firestore.dart';

class FoodMenus {
  FoodMenus(
      {this.foodName,
      this.foodDescription,
      this.foodImage,
      this.foodPrice,
      this.sellerName});

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final String? sellerName;

  factory FoodMenus.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      FoodMenus(
          foodName: json["foodName"],
          foodDescription: json["foodDescription"],
          foodImage: json["foodImage"],
          foodPrice: json["foodPrice"],
          sellerName: json["sellerName"]);

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "sellerName": sellerName
      };
}
