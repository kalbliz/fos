// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Categories {
  Categories({
    this.categoryName,
    this.id,
    this.categoryDescription,
    this.categoryImage,
   
  });

  final String? categoryName;
  final String? categoryDescription;
  final String? categoryImage;
  dynamic id;


  factory Categories.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      Categories(
          categoryName: json["categoryName"],
          categoryDescription: json["categoryDescription"],
          categoryImage: json["categoryImage"],
          
          id: json.id);

  Map<String, dynamic> toMap() => {
        "categoryName": categoryName,
        "categoryDescription": categoryDescription,
        "categoryImage": categoryImage,    
        "id": id,
      };
}
