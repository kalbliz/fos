class RiderData {
  RiderData({
    this.id,
    this.name,
    this.photo,
    this.email,
    this.phone,
    this.active,
    this.address,
    this.currentLocation,
    this.createdAt,
    this.updatedAt,
  });

  RiderData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
    active = json['active'];
    address = json['address'];
    currentLocation = json['current_location'] != null
        ? CurrentLocation.fromJson(json['current_location'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? name;
  String? photo;
  String? email;
  String? phone;
  num? active;
  String? address;
  CurrentLocation? currentLocation;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['photo'] = photo;
    map['email'] = email;
    map['phone'] = phone;
    map['active'] = active;
    map['address'] = address;
    if (currentLocation != null) {
      map['current_location'] = currentLocation?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class CurrentLocation {
  CurrentLocation({
    this.longitude,
    this.latitude,
    this.timestamp,
  });

  CurrentLocation.fromJson(dynamic json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    timestamp = json['timestamp'];
  }
  String? longitude;
  String? latitude;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['timestamp'] = timestamp;
    return map;
  }
}
