import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/person/model/occupation.dart';

import 'address.dart';

@immutable
class Person {
  final PersonalInfo personalInfo;
  final Address address;
  final Occupation occupation;
  final AadharBankDetail aadhaarBank;
  final PanVoterDetail panVoterDetail;
  final Disability disability;

  Person({this.personalInfo, this.address, this.occupation, this.aadhaarBank, this.panVoterDetail, this.disability});

  Person copyWith({ PersonalInfo personalInfo, Address address, Occupation occupation, AadharBankDetail aadhaarBank, PanVoterDetail panVoterDetail, Disability disability }) {
    return Person(
      personalInfo: personalInfo ?? this.personalInfo,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      aadhaarBank: aadhaarBank ?? this.aadhaarBank,
      panVoterDetail: panVoterDetail ?? this.panVoterDetail,
      disability: disability ?? this.disability
    );
  }

  @override
  String toString() {
    return 'Person{personalInfo: $personalInfo, address: $address, occupation: $occupation, aadhaarBank: $aadhaarBank, panVoterDetail: $panVoterDetail, disability: $disability}';
  }


//  PersonEntity toEntity() {
//    return PersonEntity(personalInfo: personalInfo, address: address, occupation: occupation, aadhaarBank: aadhaarBank, panVoterDetail: panVoterDetail);
//  }
//
//  static Person fromEntity(PersonEntity entity) {
//    return Person(
//      personalInfo: entity.personalInfo,
//      address: entity.address,
//      occupation: entity.occupation,
//      aadhaarBank: entity.aadhaarBank,
//      panVoterDetail: entity.panVoterDetail,
//    );
//  }
}

@immutable
class PersonalInfo {
  final String sno;
  final String name;
  final String mobile;
  final String whatsapp;
  final String gender;
  final DateTime dob;
  final String fatherName;
  final String motherName;

  PersonalInfo({this.sno, this.name, this.mobile, this.whatsapp, this.gender = "M", this.dob, this.fatherName, this.motherName});

  PersonalInfo copyWith({ String sno, String name, String mobile, String whatsapp, String gender, DateTime dob, String fatherName, String motherName }) {
    return PersonalInfo(
      sno: sno ?? this.sno,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
    );
  }

  @override
  String toString() {
    return 'PersonalInfo{sno: $sno, name: $name, mobile: $mobile, whatsapp: $whatsapp, gender: $gender, dob: $dob, fatherName: $fatherName, motherName: $motherName}';
  }

//  PersonalInfoEntity toEntity() {
//    return PersonalInfoEntity(sno: sno, name: name, mobile: mobile, whatsapp: whatsapp, gender: gender, dob: dob, fatherName: fatherName, motherName: motherName);
//  }
//
//  static PersonalInfo fromEntity(PersonalInfoEntity entity) {
//    return PersonalInfo(
//      sno: entity.sno,
//      name: entity.name,
//      mobile: entity.mobile,
//      whatsapp: entity.whatsapp,
//      gender: entity.gender,
//      dob: entity.dob,
//      fatherName: entity.fatherName,
//      motherName: entity.motherName,
//    );
//  }

}

@immutable
class AadharBankDetail {
  final String aadhaarNo;
  final String frontUrl;
  final String backUrl;
  final bool bankLinked;
  final String bankName;
  final String accountNumber;
  final String ifscCode;

  @override
  String toString() {
    return 'AadharBankDetail{aadhaarNo: $aadhaarNo, frontUrl: $frontUrl, backUrl: $backUrl, bankLinked: $bankLinked, bankName: $bankName, accountNumber: $accountNumber, ifscCode: $ifscCode}';
  }

  AadharBankDetail({this.aadhaarNo, this.frontUrl, this.backUrl, this.bankLinked = false, this.bankName, this.accountNumber, this.ifscCode});

  AadharBankDetail copyWith({ String aadhaarNo, String frontUrl, String backUrl, bool bankLinked, String bankName, String accountNumber, String ifscCode }) {
    return AadharBankDetail(
      aadhaarNo: aadhaarNo ?? this.aadhaarNo,
      frontUrl: frontUrl ?? this.frontUrl,
      backUrl: backUrl ?? this.backUrl,
      bankLinked: bankLinked ?? this.bankLinked,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      ifscCode: ifscCode ?? this.ifscCode,
    );
  }


//  AadharBankDetailEntity toEntity() {
//    return AadharBankDetailEntity(aadhaar: aadhaar, frontUrl: frontUrl, backUrl: backUrl, bankLinked: bankLinked, bankName: bankName, accountNumber: accountNumber, ifscCode: ifscCode);
//  }
//
//  static AadharBankDetail fromEntity(AadharBankDetailEntity entity) {
//    return AadharBankDetail(
//      aadhaar: entity.aadhaar,
//      frontUrl: entity.frontUrl,
//      backUrl: entity.backUrl,
//      bankLinked: entity.bankLinked,
//      bankName: entity.bankName,
//      accountNumber: entity.accountNumber,
//      ifscCode: entity.ifscCode,
//    );
//  }
}

@immutable
class PanVoterDetail {
  final String pancard;
  final String panUrl;
  final String voterCard;
  final String voterUrlFront;
  final String voterUrlBack;

  @override
  String toString() {
    return 'PanVoterDetail{pancard: $pancard, panUrl: $panUrl, voterCard: $voterCard, voterUrlFront: $voterUrlFront, voterUrlBack: $voterUrlBack}';
  }

  PanVoterDetail({this.pancard, this.panUrl, this.voterCard, this.voterUrlFront, this.voterUrlBack});

  PanVoterDetail copyWith({ String pancard, String panUrl, String voterCard, String voterUrlFront, String voterUrlBack }) {
    return PanVoterDetail(
      pancard: pancard ?? this.pancard,
      panUrl: panUrl ?? this.panUrl,
      voterCard: voterCard ?? this.voterCard,
      voterUrlFront: voterUrlFront ?? this.voterUrlFront,
      voterUrlBack: voterUrlBack ?? this.voterUrlBack,
    );
  }

//  PanVoterDetailEntity toEntity() {
//    return PanVoterDetailEntity(pancard: pancard, panUrl: panUrl, voterCard: voterCard, voterUrlFront: voterUrlFront, voterUrlBack: voterUrlBack);
//  }
//
//  static PanVoterDetail fromEntity(PanVoterDetailEntity entity) {
//    return PanVoterDetail(
//      pancard: entity.pancard,
//      panUrl: entity.panUrl,
//      voterCard: entity.voterCard,
//      voterUrlFront: entity.voterUrlFront,
//      voterUrlBack: entity.voterUrlBack,
//    );
//  }
}

class Disability {
  final bool disable;
  final String certificateNo;
  final String certificateUrl;

  Disability({this.disable = false, this.certificateNo, this.certificateUrl});

  Disability copyWith({bool disable, String cerificateNo, String certificateUrl }) {
    return Disability(
      disable: disable ?? this.disable,
      certificateNo: cerificateNo ?? this.certificateNo,
      certificateUrl: certificateUrl ?? this.certificateUrl
    );
  }

  @override
  String toString() {
    return 'Disability{disable: $disable, certificateNo: $certificateNo, certificateUrl: $certificateUrl}';
  }
}