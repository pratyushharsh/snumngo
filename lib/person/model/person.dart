import 'package:equatable/equatable.dart';
import 'package:snumngo/person/model/occupation.dart';

import 'address.dart';

class Person  extends Equatable{
  final PersonalInfo personalInfo;
  final Address address;
  final Occupation occupation;
  final AadharBankDetail aadhaarBank;
  final PanVoterDetail panVoterDetail;

  Person({this.personalInfo, this.address, this.occupation, this.aadhaarBank, this.panVoterDetail});

  Person copyWith({ PersonalInfo personalInfo, Address address, Occupation occupation, AadharBankDetail aadhaarBank, PanVoterDetail panVoterDetail }) {
    return Person(
      personalInfo: personalInfo ?? this.personalInfo,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      aadhaarBank: aadhaarBank ?? this.aadhaarBank,
      panVoterDetail: panVoterDetail ?? this.panVoterDetail,
    );
  }

  @override
  List<Object> get props => [personalInfo, address, occupation, aadhaarBank, panVoterDetail];

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

class PersonalInfo  extends Equatable{
  final String sno;
  final String name;
  final String mobile;
  final String whatsapp;
  final String gender;
  final DateTime dob;
  final String fatherName;
  final String motherName;

  PersonalInfo({this.sno, this.name, this.mobile, this.whatsapp, this.gender, this.dob, this.fatherName, this.motherName});

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
  List<Object> get props => [sno, name, mobile, whatsapp, gender, dob, fatherName, motherName];

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

class AadharBankDetail  extends Equatable{
  final String aadhaarNo;
  final String frontUrl;
  final String backUrl;
  final bool bankLinked;
  final String bankName;
  final String accountNumber;
  final String ifscCode;

  AadharBankDetail({this.aadhaarNo, this.frontUrl, this.backUrl, this.bankLinked, this.bankName, this.accountNumber, this.ifscCode});

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

  @override
  List<Object> get props => [aadhaarNo, frontUrl, backUrl, bankLinked, bankName, accountNumber, ifscCode];
//
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

class PanVoterDetail  extends Equatable{
  final String pancard;
  final String panUrl;
  final String voterCard;
  final String voterUrlFront;
  final String voterUrlBack;

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

  @override
  List<Object> get props => [pancard, panUrl, voterCard, voterUrlFront, voterUrlBack];

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