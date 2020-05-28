import 'dart:collection';

import 'package:equatable/equatable.dart';

class StreetVendor  extends Equatable implements Occupation {
  final bool surveyed;
  final String municipalId;
  final String certificateNo;
  final String placeEmployee;
  final bool foodVendor;
  final bool fssaiTraining;
  final bool fssaiTrainingCertificate;
  final String otherOrganization;

  StreetVendor({this.surveyed = false, this.municipalId, this.certificateNo, this.placeEmployee, this.foodVendor = false, this.fssaiTraining = false, this.fssaiTrainingCertificate = false, this.otherOrganization});

  StreetVendor copyWith({ bool surveyed, String municipalId, String certificateNo, String placeEmployee, bool foodVendor, bool fssaiTraining, bool fssaiTrainingCertificate, String otherOrganization }) {
    return StreetVendor(
      surveyed: surveyed ?? this.surveyed,
      municipalId: municipalId ?? this.municipalId ,
      certificateNo: certificateNo ?? this.certificateNo,
      placeEmployee: placeEmployee ?? this.placeEmployee,
      foodVendor: foodVendor ?? this.foodVendor,
      fssaiTraining: fssaiTraining ?? this.fssaiTraining,
      fssaiTrainingCertificate: fssaiTrainingCertificate ?? this.fssaiTrainingCertificate,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [surveyed, municipalId, certificateNo, placeEmployee, foodVendor, fssaiTraining, fssaiTrainingCertificate, otherOrganization];

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    _map.putIfAbsent('surveyed_strt_vndr', () => surveyed);
    _map.putIfAbsent('strt_vndr_id_no', () => municipalId);
    _map.putIfAbsent('strt_vndr_muni_cert_no', () => certificateNo);
    _map.putIfAbsent('strt_vndr_plc_emp', () => placeEmployee);
    _map.putIfAbsent('strt_vndr_fssai', () => fssaiTraining);
    _map.putIfAbsent('strt_vndr_fssai_trni', () => fssaiTrainingCertificate);
    _map.putIfAbsent('r_u_affiliated_org', () => otherOrganization);
    return _map;
  }

  @override
  String type() {
    return "Street Vendor";
  }

//  StreetVendorEntity toEntity() {
//    return StreetVendorEntity(surveyed: surveyed, municipalId: municipalId, certificateNo: certificateNo, placeEmployee: placeEmployee, foodVendor: foodVendor, fssaiTraining: fssaiTraining, fssaiTrainingCertificate: fssaiTrainingCertificate, otherOrganization: otherOrganization);
//  }
//
//  static StreetVendor fromEntity(StreetVendorEntity entity) {
//    return StreetVendor(
//      surveyed: entity.surveyed,
//      municipalId: entity.municipalId,
//      certificateNo: entity.certificateNo,
//      placeEmployee: entity.placeEmployee,
//      foodVendor: entity.foodVendor,
//      fssaiTraining: entity.fssaiTraining,
//      fssaiTrainingCertificate: entity.fssaiTrainingCertificate,
//      otherOrganization: entity.otherOrganization,
//    );
//  }
}

class ConstructionWorker  extends Equatable implements Occupation {
  final String registeredNo;
  final String laborNumber;
  final String otherOrganization;

  ConstructionWorker({this.registeredNo, this.laborNumber, this.otherOrganization});

  ConstructionWorker copyWith({ String registeredNo, String laborNumber, String otherOrganization }) {
    return ConstructionWorker(
      registeredNo: registeredNo ?? this.registeredNo,
      laborNumber: laborNumber ?? this.laborNumber,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [registeredNo, laborNumber, otherOrganization];

  @override
  String type() {
    return "Construction Worker";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

//  ConstructionWorkerEntity toEntity() {
//    return ConstructionWorkerEntity(registeredNo: registeredNo, laborNumber: laborNumber, otherOrganization: otherOrganization);
//  }
//
//  static ConstructionWorker fromEntity(ConstructionWorkerEntity entity) {
//    return ConstructionWorker(
//      registeredNo: entity.registeredNo,
//      laborNumber: entity.laborNumber,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class WastePicker  extends Equatable implements Occupation {
  final String registrationNumber;
  final bool idIssueByInst;
  final String otherOrganization;

  WastePicker({this.registrationNumber, this.idIssueByInst = false, this.otherOrganization});

  WastePicker copyWith({ String registrationNumber, bool idIssueByInst, String otherOrganization }) {
    return WastePicker(
      registrationNumber: registrationNumber ?? this.registrationNumber,
      idIssueByInst: idIssueByInst ?? this.idIssueByInst,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [registrationNumber, idIssueByInst, otherOrganization];

  @override
  String type() {
    return "Waste Picker";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

//  WastePickerEntity toEntity() {
//    return WastePickerEntity(registrationNumber: registrationNumber, idIssueByInst: idIssueByInst, otherOrganization: otherOrganization);
//  }
//
//  static WastePicker fromEntity(WastePickerEntity entity) {
//    return WastePicker(
//      registrationNumber: entity.registrationNumber,
//      idIssueByInst: entity.idIssueByInst,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class DomesticWorker  extends Equatable implements Occupation {
  final String rwaNumber;
  final DateTime verifyTime;
  final String otherOrganization;
  final String instituteId;

  DomesticWorker({this.rwaNumber, this.verifyTime, this.otherOrganization, this.instituteId,});

  DomesticWorker copyWith({ String rwaNumber, DateTime verifyTime, String otherOrganization, String instituteId }) {
    return DomesticWorker(
      rwaNumber: rwaNumber ?? this.rwaNumber,
      verifyTime: verifyTime ?? this.verifyTime,
      otherOrganization: otherOrganization ?? this.otherOrganization,
      instituteId: instituteId ?? this.instituteId
    );
  }

  @override
  List<Object> get props => [rwaNumber, verifyTime, otherOrganization, instituteId];

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  @override
  String type() {
    return "Domestic Worker";
  }

//  DomesticWorkerEntity toEntity() {
//    return DomesticWorkerEntity(rwaNumber: rwaNumber, verifyTime: verifyTime, otherOrganization: otherOrganization);
//  }
//
//  static DomesticWorker fromEntity(DomesticWorkerEntity entity) {
//    return DomesticWorker(
//      rwaNumber: entity.rwaNumber,
//      verifyTime: entity.verifyTime,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class HomeBasedWorker  extends Equatable implements Occupation {
  final String artisanNo;
  final bool artisanCreditCard;
  final bool artisanAadharCard;
  final String otherOrganization;

  HomeBasedWorker({this.artisanNo, this.artisanCreditCard = false, this.artisanAadharCard = false, this.otherOrganization});

  HomeBasedWorker copyWith({ String artisanNo, bool artisanCreditCard, bool artisanAadharCard, String otherOrganization }) {
    return HomeBasedWorker(
      artisanNo: artisanNo ?? this.artisanNo,
      artisanCreditCard: artisanCreditCard ?? this.artisanCreditCard,
      artisanAadharCard: artisanAadharCard ?? this.artisanAadharCard,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [artisanNo, artisanCreditCard, artisanAadharCard, otherOrganization];

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  @override
  String type() {
    return "Home Based Worker";
  }

//  HomeBasedWorkerEntity toEntity() {
//    return HomeBasedWorkerEntity(artisanNo: artisanNo, artisanCreditCard: artisanCreditCard, artisanAadharCard: artisanAadharCard, otherOrganization: otherOrganization);
//  }
//
//  static HomeBasedWorker fromEntity(HomeBasedWorkerEntity entity) {
//    return HomeBasedWorker(
//      artisanNo: entity.artisanNo,
//      artisanCreditCard: entity.artisanCreditCard,
//      artisanAadharCard: entity.artisanAadharCard,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class RickShawPuller  extends Equatable implements Occupation {
  final bool surveyedLabour;
  final String licenceNo;
  final String otherOrganization;

  RickShawPuller({this.surveyedLabour = false, this.licenceNo, this.otherOrganization});

  RickShawPuller copyWith({ bool surveyedLabour, String licenceNo, String otherOrganization }) {
    return RickShawPuller(
      surveyedLabour: surveyedLabour ?? this.surveyedLabour,
      licenceNo: licenceNo ?? this.licenceNo,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [surveyedLabour, licenceNo, otherOrganization];

  @override
  String type() {
    return "Risckhaw Puller";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

//  RickShawPullerEntity toEntity() {
//    return RickShawPullerEntity(surveyedLabour: surveyedLabour, licenceNo: licenceNo, otherOrganization: otherOrganization);
//  }
//
//  static RickShawPuller fromEntity(RickShawPullerEntity entity) {
//    return RickShawPuller(
//      surveyedLabour: entity.surveyedLabour,
//      licenceNo: entity.licenceNo,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class AgricultureLabour  extends Equatable implements Occupation {
  final bool minimumWageAware;
  final bool getMinimumWage;
  final String otherOrganization;

  AgricultureLabour({this.minimumWageAware = false, this.getMinimumWage = false, this.otherOrganization});

  AgricultureLabour copyWith({ bool minimumWageAware, bool getMinimumWage, String otherOrganization }) {
    return AgricultureLabour(
      minimumWageAware: minimumWageAware ?? this.minimumWageAware,
      getMinimumWage: getMinimumWage ?? this.getMinimumWage,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [minimumWageAware, getMinimumWage, otherOrganization];

  @override
  String type() {
    return "Agriculture Labour";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

//  AgricultureLabourEntity toEntity() {
//    return AgricultureLabourEntity(minimumWageAware: minimumWageAware, getMinimumWage: getMinimumWage, otherOrganization: otherOrganization);
//  }
//
//  static AgricultureLabour fromEntity(AgricultureLabourEntity entity) {
//    return AgricultureLabour(
//      minimumWageAware: entity.minimumWageAware,
//      getMinimumWage: entity.getMinimumWage,
//      otherOrganization: entity.otherOrganization,
//    );
//  }

}

class Occupation {

  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  String type() {
    return "Others";
  }
}