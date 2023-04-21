import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantModel {
  ResturantModel(
      {this.userAddress,
      this.userEmail,
      this.userID,
      this.userName,
      this.userPhoneNumber,
      this.userPhoto,
      this.earnings});

  final String? userAddress;
  final String? userEmail;
  final String? userID;
  final String? userName;
  final String? userPhoneNumber;
  final String? userPhoto;
  final num? earnings;

  factory ResturantModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      ResturantModel(
        userAddress: json['userAddress'],
        userEmail: json['userEmail'],
        userID: json['userID'],
        userName: json['userName'],
        userPhoneNumber: json['userPhoneNumber'],
        userPhoto: json['userPhoto'],
        earnings: json['earnings'],
      );

  Map<String, dynamic> toMap() => {
        'userAddress': userAddress,
        'userEmail': userEmail,
        "userID": userID,
        "userName": userName,
        "userPhoneNumber": userPhoneNumber,
        "userPhoto": userPhoto,
        "earnings": earnings
      };
}
