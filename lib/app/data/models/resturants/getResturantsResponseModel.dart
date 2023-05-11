import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(
      {this.userAddress,
      this.userEmail,
      this.userID,
      this.userName,
      this.userPhoneNumber,
      this.userPhoto,
      this.userState,
      this.earnings});

  final String? userAddress;
  final String? userEmail;
  final String? userID;
  final String? userName;
  final String? userPhoneNumber;
  final String? userPhoto;
   final String? userState;
  final num? earnings;

  factory UserModel.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        userAddress: json['userAddress'],
        userEmail: json['userEmail'],
        userID: json['userID'],
        userName: json['userName'],
        userPhoneNumber: json['userPhoneNumber'],
        userPhoto: json['userPhoto'],
        earnings: json['earnings'],
        userState: json['userState']
      );

  Map<String, dynamic> toMap() => {
        'userAddress': userAddress,
        'userEmail': userEmail,
        "userID": userID,
        "userName": userName,
        "userPhoneNumber": userPhoneNumber,
        "userPhoto": userPhoto,
        "earnings": earnings,
        "userState":userState
      };
}
