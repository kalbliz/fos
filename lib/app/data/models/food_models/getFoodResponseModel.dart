import 'package:cloud_firestore/cloud_firestore.dart';

class FoodMenus {
  FoodMenus( {
    this.foodName,
    this.id,
    this.foodDescription,
    this.foodImage,
    this.foodPrice,
    this.resturantName,
    this.resturantAddress,
  });

  final String? foodName;
  final String? foodDescription;
  final String? foodImage;
  final num? foodPrice;
  final String? resturantName;
  dynamic id;
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
          id: json.id);

  Map<String, dynamic> toMap() => {
        "foodName": foodName,
        "foodDescription": foodDescription,
        "foodImage": foodImage,
        "foodPrice": foodPrice,
        "resturantName": resturantName,
        "resturantAddress":resturantAddress,
        "id": id
      };
}
