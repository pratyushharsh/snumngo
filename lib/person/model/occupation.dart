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

  StreetVendor({this.surveyed, this.municipalId, this.certificateNo, this.placeEmployee, this.foodVendor, this.fssaiTraining, this.fssaiTrainingCertificate, this.otherOrganization});

  StreetVendor copyWith({ bool surveyed, String municipalId, String certificateNo, String placeEmployee, bool foodVendor, bool fssaiTraining, bool fssaiTrainingCertificate, String otherOrganization }) {
    return StreetVendor(
      surveyed: surveyed ?? this.surveyed ?? false,
      municipalId: municipalId ?? this.municipalId ,
      certificateNo: certificateNo ?? this.certificateNo,
      placeEmployee: placeEmployee ?? this.placeEmployee,
      foodVendor: foodVendor ?? this.foodVendor ?? false,
      fssaiTraining: fssaiTraining ?? this.fssaiTraining ?? false,
      fssaiTrainingCertificate: fssaiTrainingCertificate ?? this.fssaiTrainingCertificate ?? false,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [surveyed, municipalId, certificateNo, placeEmployee, foodVendor, fssaiTraining, fssaiTrainingCertificate, otherOrganization];

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

  WastePicker({this.registrationNumber, this.idIssueByInst, this.otherOrganization});

  WastePicker copyWith({ String registrationNumber, bool idIssueByInst, String otherOrganization }) {
    return WastePicker(
      registrationNumber: registrationNumber ?? this.registrationNumber,
      idIssueByInst: idIssueByInst ?? this.idIssueByInst  ?? false,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [registrationNumber, idIssueByInst, otherOrganization];

  @override
  String type() {
    return "Waste Picker";
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

  DomesticWorker({this.rwaNumber, this.verifyTime, this.otherOrganization});

  DomesticWorker copyWith({ String rwaNumber, DateTime verifyTime, String otherOrganization }) {
    return DomesticWorker(
      rwaNumber: rwaNumber ?? this.rwaNumber,
      verifyTime: verifyTime ?? this.verifyTime,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [rwaNumber, verifyTime, otherOrganization];

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

  HomeBasedWorker({this.artisanNo, this.artisanCreditCard, this.artisanAadharCard, this.otherOrganization});

  HomeBasedWorker copyWith({ String artisanNo, bool artisanCreditCard, bool artisanAadharCard, String otherOrganization }) {
    return HomeBasedWorker(
      artisanNo: artisanNo ?? this.artisanNo,
      artisanCreditCard: artisanCreditCard ?? this.artisanCreditCard ?? false,
      artisanAadharCard: artisanAadharCard ?? this.artisanAadharCard ?? false,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [artisanNo, artisanCreditCard, artisanAadharCard, otherOrganization];

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

  RickShawPuller({this.surveyedLabour, this.licenceNo, this.otherOrganization});

  RickShawPuller copyWith({ bool surveyedLabour, String licenceNo, String otherOrganization }) {
    return RickShawPuller(
      surveyedLabour: surveyedLabour ?? this.surveyedLabour ?? false,
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

  AgricultureLabour({this.minimumWageAware, this.getMinimumWage, this.otherOrganization});

  AgricultureLabour copyWith({ bool minimumWageAware, bool getMinimumWage, String otherOrganization }) {
    return AgricultureLabour(
      minimumWageAware: minimumWageAware ?? this.minimumWageAware ?? false,
      getMinimumWage: getMinimumWage ?? this.getMinimumWage ?? false,
      otherOrganization: otherOrganization ?? this.otherOrganization,
    );
  }

  @override
  List<Object> get props => [minimumWageAware, getMinimumWage, otherOrganization];

  @override
  String type() {
    return "Agriculture Labour";
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
  String type() {
    return "Others";
  }
}