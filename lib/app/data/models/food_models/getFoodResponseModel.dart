// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fos/app/data/models/categories/get_categories_response.dart';

class FoodMenus {
  FoodMenus({
    this.foodName,
    this.categories,
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
  final List<Categories>? categories;

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
          categories: json["categories"] == null
              ? []
              : List<Categories>.from(json["categories"]!
                  .map((x) => Categories.fromDocumentSnapshot(x))),
          id: json.id);

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "resturantName": resturantName,
        "resturantAddress": resturantAddress,
        "id": id,
        "resturantId": resturantId,
        "categories": categories
      };
}
