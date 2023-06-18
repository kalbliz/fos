// To parse this JSON data, do
//
//     final createRider = createRiderFromJson(jsonString);

import 'dart:convert';

CreateRider createRiderFromJson(String str) =>
    CreateRider.fromJson(json.decode(str));

String createRiderToJson(CreateRider data) => json.encode(data.toJson());

class CreateRider {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? photo;

  CreateRider({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.photo,
  });

  factory CreateRider.fromJson(Map<String, dynamic> json) => CreateRider(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "photo": photo,
      };
}
