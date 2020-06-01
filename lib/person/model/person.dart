import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/person/model/occupation.dart';

import 'address.dart';

@immutable
class Worker {
  final String uuid;
  final WorkerInfo personalInfo;
  final Address address;
  final Occupation occupation;
  final AadharBankDetail aadhaarBank;
  final PanVoterDetail panVoterDetail;
  final Disability disability;

  Worker(
      {this.uuid,
      this.personalInfo,
      this.address,
      this.occupation,
      this.aadhaarBank,
      this.panVoterDetail,
      this.disability});

  Worker copyWith(
      {String uuid,
      WorkerInfo personalInfo,
      Address address,
      Occupation occupation,
      AadharBankDetail aadhaarBank,
      PanVoterDetail panVoterDetail,
      Disability disability}) {
    return Worker(
        uuid: uuid ?? this.uuid,
        personalInfo: personalInfo ?? this.personalInfo,
        address: address ?? this.address,
        occupation: occupation ?? this.occupation,
        aadhaarBank: aadhaarBank ?? this.aadhaarBank,
        panVoterDetail: panVoterDetail ?? this.panVoterDetail,
        disability: disability ?? this.disability);
  }

  @override
  String toString() {
    return 'Person{personalInfo: $personalInfo, address: $address, occupation: $occupation, aadhaarBank: $aadhaarBank, panVoterDetail: $panVoterDetail, disability: $disability}';
  }

  static Worker fromSnapshot(DocumentSnapshot snap) {
    WorkerInfo pI = WorkerInfo(
        sno: snap.documentID,
        name: snap.data['name'],
        profileUrl: snap.data['profile_url'],
        gender: snap.data['gender'],
        dob: snap.data['dob']?.toDate(),
        motherName: snap.data['mother_name'],
        fatherName: snap.data['father_name'],
        whatsapp: snap.data['whatsapp'],
        mobile: snap.data['primary_no']);
    Address ad = Address.fromJson(snap.data['address']);
    AadharBankDetail abd = AadharBankDetail(
        aadhaarNo: snap.data['aadhaar'],
        frontUrl: snap.data['aadhaar_url']['front'],
        backUrl: snap.data['aadhaar_url']['back'],
        bankLinked: snap.data['aadhaar_bank_linked'],
        bankName: snap.data['bank_account']['name'],
        accountNumber: snap.data['bank_account']['account_no'],
        ifscCode: snap.data['bank_account']['ifsc']);
    PanVoterDetail pvd = PanVoterDetail(
      pancard: snap.data['pan_no'],
      panUrl: snap.data['pan_url'],
      voterCard: snap.data['voter_id'],
      voterUrlFront: snap.data['voter_id_url']['front'],
      voterUrlBack: snap.data['voter_id_url']['back'],
    );
    Disability disability = Disability(
        disable: snap.data['disable'],
        certificateUrl: snap.data['disablity_cert_url'],
        certificateNo: snap.data['disablity_cert_no']);

    Occupation occp = Occupation.fromSnapShot(
        snap.data['occupation_type'], snap.data['occupation']);

    return Worker(
      uuid: snap.documentID,
        personalInfo: pI,
        address: ad,
        aadhaarBank: abd,
        panVoterDetail: pvd,
        disability: disability,
        occupation: occp);
  }

  //@TODO RAtion Card detail
  Map<String, Object> toDocument() {
    String occType = 'others';

    if (occupation is StreetVendor) {
      occType = 'street_vendor';
    } else if (occupation is ConstructionWorker) {
      occType = 'construction_worker';
    } else if (occupation is WastePicker) {
      occType = 'waste_picker';
    } else if (occupation is DomesticWorker) {
      occType = 'domestic_worker';
    } else if (occupation is HomeBasedWorker) {
      occType = 'home_worker';
    } else if (occupation is RickshawPuller) {
      occType = 'rickshaw_puller';
    } else if (occupation is AgricultureLabour) {
      occType = 'agriculture_labour';
    }

    return {
      'created_by': 'createdby',
      'created_on': '6523432',
      'updated_on': 'update_date',
      'sno': personalInfo.sno,
      'name': personalInfo.name,
      'profile_url': personalInfo.profileUrl,
      'primary_no': personalInfo.mobile,
      'whatsapp': personalInfo.whatsapp,
      'gender': personalInfo.gender,
      'dob': personalInfo.dob,
      'father_name': personalInfo.fatherName,
      'mother_name': personalInfo.motherName,
      'disable': disability.disable,
      'disablity_cert_url': disability.certificateUrl,
      'disablity_cert_no': disability.certificateNo,
      'aadhaar': aadhaarBank.aadhaarNo,
      'aadhaar_bank_linked': aadhaarBank.bankLinked,
      'aadhaar_url': aadhaarBank.aadhaarUrl(),
      'bank_account': aadhaarBank.bankDetail(),
      'pan_no': panVoterDetail.pancard,
      'pan_url': panVoterDetail.panUrl,
      'voter_id': panVoterDetail.voterCard,
      'voter_id_url': panVoterDetail.getVoterUrl(),
      'occupation_type': occType,
      'address': address.toJson(),
      'occupation': occupation.toJson()
    };
  }
}

@immutable
class WorkerInfo {
  final String sno;
  final String name;
  final String mobile;
  final String whatsapp;
  final String gender;
  final DateTime dob;
  final String fatherName;
  final String motherName;
  final String profileUrl;

  WorkerInfo(
      {this.sno,
      this.name,
      this.mobile,
      this.whatsapp,
      this.gender = "M",
      this.dob,
      this.fatherName,
      this.motherName,
      this.profileUrl});

  WorkerInfo copyWith(
      {String sno,
      String name,
      String mobile,
      String whatsapp,
      String gender,
      DateTime dob,
      String fatherName,
      String motherName,
      String profileUrl}) {
    return WorkerInfo(
        sno: sno ?? this.sno,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        fatherName: fatherName ?? this.fatherName,
        motherName: motherName ?? this.motherName,
        profileUrl: profileUrl ?? this.profileUrl);
  }

  @override
  String toString() {
    return 'PersonalInfo{sno: $sno, name: $name, mobile: $mobile, whatsapp: $whatsapp, gender: $gender, dob: $dob, fatherName: $fatherName, motherName: $motherName, profileUrl: $profileUrl}';
  }
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

  Map<String, String> aadhaarUrl() => {'front': frontUrl, 'back': backUrl};

  Map<String, String> bankDetail() =>
      {'name': bankName, 'account_no': accountNumber, 'ifsc': ifscCode};

  AadharBankDetail(
      {this.aadhaarNo,
      this.frontUrl,
      this.backUrl,
      this.bankLinked = false,
      this.bankName,
      this.accountNumber,
      this.ifscCode});

  AadharBankDetail copyWith(
      {String aadhaarNo,
      String frontUrl,
      String backUrl,
      bool bankLinked,
      String bankName,
      String accountNumber,
      String ifscCode}) {
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

  PanVoterDetail(
      {this.pancard,
      this.panUrl,
      this.voterCard,
      this.voterUrlFront,
      this.voterUrlBack});

  PanVoterDetail copyWith(
      {String pancard,
      String panUrl,
      String voterCard,
      String voterUrlFront,
      String voterUrlBack}) {
    return PanVoterDetail(
      pancard: pancard ?? this.pancard,
      panUrl: panUrl ?? this.panUrl,
      voterCard: voterCard ?? this.voterCard,
      voterUrlFront: voterUrlFront ?? this.voterUrlFront,
      voterUrlBack: voterUrlBack ?? this.voterUrlBack,
    );
  }

  Map<String, String> getVoterUrl() =>
      {'front': voterUrlFront, 'back': voterUrlBack};
}

class Disability {
  final bool disable;
  final String certificateNo;
  final String certificateUrl;

  Disability({this.disable = false, this.certificateNo, this.certificateUrl});

  Disability copyWith(
      {bool disable, String cerificateNo, String certificateUrl}) {
    return Disability(
        disable: disable ?? this.disable,
        certificateNo: cerificateNo ?? this.certificateNo,
        certificateUrl: certificateUrl ?? this.certificateUrl);
  }

  @override
  String toString() {
    return 'Disability{disable: $disable, certificateNo: $certificateNo, certificateUrl: $certificateUrl}';
  }
}
