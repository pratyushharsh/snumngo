import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Address {
  final String houseNo;
  final String street;
  final String city;
  final String ward;
  final String municipal;
  final String district;
  final String pincode;
  final String state;

  Address({this.houseNo, this.street, this.city, this.ward, this.municipal, this.district, this.pincode, this.state});

  Address copyWith({ String houseNo, String street, String city, String ward, String municipal, String district, String pincode, String state }) {
    return Address(
      houseNo: houseNo ?? this.houseNo,
      street: street ?? this.street,
      city: city ?? this.city,
      ward: ward ?? this.ward,
      municipal: municipal ?? this.municipal,
      district: district ?? this.district,
      pincode: pincode ?? this.pincode,
      state: state ?? this.state,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    houseNo: json["houseNo"],
    street: json["street"],
    city: json["city"],
    ward: json["ward"],
    municipal: json["municipal"],
    pincode: json["pincode"],
    district: json["district"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "houseNo": houseNo,
    "street": street,
    "city": city,
    "ward": ward,
    "municipal": municipal,
    "pincode": pincode,
    "district": district,
    "state": state,
  };

  @override
  String toString() {
    return 'Address{houseNo: $houseNo, street: $street, city: $city, ward: $ward, municipal: $municipal, district: $district, pincode: $pincode, state: $state}';
  }


//  AddressEntity toEntity() {
//    return AddressEntity(houseNo: houseNo, street: street, city: city, ward: ward, municipal: municipal, district: district, pincode: pincode, state: state);
//  }
//
//  static Address fromEntity(AddressEntity entity) {
//    return Address(
//      houseNo: entity.houseNo,
//      street: entity.street,
//      city: entity.city,
//      ward: entity.ward,
//      municipal: entity.municipal,
//      district: entity.district,
//      pincode: entity.pincode,
//      state: entity.state,
//    );
//  }

}