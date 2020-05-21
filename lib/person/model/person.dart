import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'address.dart';

@immutable
class Person extends Equatable{
  final String sno;
  final String name;
  final String mobile;
  final String whatsapp;
  final String gender;
  final DateTime dob;
  final Address address;
  final String occupation;
  final String aadhaar;
  final List<String> aadharUrl;
  final String pancard;
  final String pancardUrl;
  final String voterId;
  final List<String> voterUrl;

  Person({this.sno, this.name, this.mobile, this.whatsapp, this.gender, this.dob, this.address, this.occupation, this.aadhaar, this.aadharUrl, this.pancard, this.pancardUrl, this.voterId, this.voterUrl});

  Person copyWith({ String sno, String name, String mobile, String whatsapp, String gender, DateTime dob, Address address, String occupation, String aadhaar, List<String> aadharUrl, String pancard, String pancardUrl, String voterId, List<String> voterUrl }) {
    return Person(
      sno: sno ?? this.sno,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      aadhaar: aadhaar ?? this.aadhaar,
      aadharUrl: aadharUrl ?? this.aadharUrl,
      pancard: pancard ?? this.pancard,
      pancardUrl: pancardUrl ?? this.pancardUrl,
      voterId: voterId ?? this.voterId,
      voterUrl: voterUrl ?? this.voterUrl,
    );
  }

  @override
  List<Object> get props => [sno, name, mobile, whatsapp, gender, dob, address, occupation, aadhaar, aadharUrl, pancard, pancardUrl, voterId, voterUrl];

//  PersonEntity toEntity() {
//    return PersonEntity(sno: sno, name: name, mobile: mobile, whatsapp: whatsapp, gender: gender, dob: dob, address: address, occupation: occupation, aadhaar: aadhaar, aadharUrl: aadharUrl, pancard: pancard, pancardUrl: pancardUrl, voterId: voterId, voterUrl: voterUrl);
//  }

//  static Person fromEntity(PersonEntity entity) {
//    return Person(
//      sno: entity.sno,
//      name: entity.name,
//      mobile: entity.mobile,
//      whatsapp: entity.whatsapp,
//      gender: entity.gender,
//      dob: entity.dob,
//      address: entity.address,
//      occupation: entity.occupation,
//      aadhaar: entity.aadhaar,
//      aadharUrl: entity.aadharUrl,
//      pancard: entity.pancard,
//      pancardUrl: entity.pancardUrl,
//      voterId: entity.voterId,
//      voterUrl: entity.voterUrl,
//    );
//  }

}
