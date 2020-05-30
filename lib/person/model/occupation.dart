import 'dart:collection';

import 'package:equatable/equatable.dart';

class StreetVendor implements Occupation {
  final bool surveyed;
  final String municipalId;
  final String certificateNo;
  final String placeOfEmp;
  final bool foodVendor;
  final bool fssaiTranie;
  final bool fssaiCertificate;
  final String otherOrg;

  StreetVendor({this.surveyed = false, this.municipalId, this.certificateNo, this.placeOfEmp, this.foodVendor = false, this.fssaiTranie = false, this.fssaiCertificate = false, this.otherOrg});

  StreetVendor copyWith({ bool surveyed, String municipalId, String certificateNo, String placeEmployee, bool foodVendor, bool fssaiTraining, bool fssaiTrainingCertificate, String otherOrganization }) {
    return StreetVendor(
      surveyed: surveyed ?? this.surveyed,
      municipalId: municipalId ?? this.municipalId ,
      certificateNo: certificateNo ?? this.certificateNo,
      placeOfEmp: placeEmployee ?? this.placeOfEmp,
      foodVendor: foodVendor ?? this.foodVendor,
      fssaiTranie: fssaiTraining ?? this.fssaiTranie,
      fssaiCertificate: fssaiTrainingCertificate ?? this.fssaiCertificate,
      otherOrg: otherOrganization ?? this.otherOrg,
    );
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    _map.putIfAbsent('surveyed_strt_vndr', () => surveyed);
    _map.putIfAbsent('strt_vndr_id_no', () => municipalId);
    _map.putIfAbsent('strt_vndr_muni_cert_no', () => certificateNo);
    _map.putIfAbsent('strt_vndr_plc_emp', () => placeOfEmp);
    _map.putIfAbsent('strt_vndr_fssai', () => fssaiTranie);
    _map.putIfAbsent('strt_vndr_fssai_trni', () => fssaiCertificate);
    _map.putIfAbsent('r_u_affiliated_org', () => otherOrg);
    return _map;
  }

  @override
  String type() {
    return "Street Vendor";
  }

  factory StreetVendor.fromJson(Map<String, dynamic> json) => StreetVendor(
    surveyed: json["surveyed"],
    municipalId: json["municipal_id"],
    certificateNo: json["certificate_no"],
    placeOfEmp: json["place_of_emp"],
    foodVendor: json["food_vendor"],
    fssaiTranie: json["fssai_tranie"],
    fssaiCertificate: json["fssai_certificate"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "surveyed": surveyed,
    "municipal_id": municipalId,
    "certificate_no": certificateNo,
    "place_of_emp": placeOfEmp,
    "food_vendor": foodVendor,
    "fssai_tranie": fssaiTranie,
    "fssai_certificate": fssaiCertificate,
    "other_org": otherOrg,
  };
}

class ConstructionWorker implements Occupation {
  final String registeredNo;
  final String labourCard;
  final String otherOrg;

  ConstructionWorker({this.registeredNo, this.labourCard, this.otherOrg});

  ConstructionWorker copyWith({ String registeredNo, String laborNumber, String otherOrganization }) {
    return ConstructionWorker(
      registeredNo: registeredNo ?? this.registeredNo,
      labourCard: laborNumber ?? this.labourCard,
      otherOrg: otherOrganization ?? this.otherOrg,
    );
  }

  @override
  String type() {
    return "Construction Worker";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();

    return _map;
  }

  factory ConstructionWorker.fromJson(Map<String, dynamic> json) => ConstructionWorker(
    registeredNo: json["registered_no"],
    labourCard: json["labour_card"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "registered_no": registeredNo,
    "labour_card": labourCard,
    "other_org": otherOrg,
  };
}

class WastePicker implements Occupation {
  final String registerationId;
  final bool idCardIssue;
  final String otherOrg;

  WastePicker({this.registerationId, this.idCardIssue = false, this.otherOrg});

  WastePicker copyWith({ String registrationNumber, bool idIssueByInst, String otherOrganization }) {
    return WastePicker(
      registerationId: registrationNumber ?? this.registerationId,
      idCardIssue: idIssueByInst ?? this.idCardIssue,
      otherOrg: otherOrganization ?? this.otherOrg,
    );
  }

  @override
  String type() {
    return "Waste Picker";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    _map.putIfAbsent('wst_pkr_rgst', () => registerationId != null);
    _map.putIfAbsent('registerstion_number', () => registerationId);
    _map.putIfAbsent('r_u_affiliated_org', () => otherOrg);
    return _map;
  }

  factory WastePicker.fromJson(Map<String, dynamic> json) => WastePicker(
    registerationId: json["registeration_id"],
    idCardIssue: json["id_card_issue"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "registeration_id": registerationId,
    "id_card_issue": idCardIssue,
    "other_org": otherOrg,
  };
}

class DomesticWorker implements Occupation {
  final String rwaId;
  final DateTime verifyTime;
  final String otherOrg;
  final String instituteId;

  DomesticWorker({this.rwaId, this.verifyTime, this.otherOrg, this.instituteId,});

  DomesticWorker copyWith({ String rwaNumber, DateTime verifyTime, String otherOrganization, String instituteId }) {
    return DomesticWorker(
      rwaId: rwaNumber ?? this.rwaId,
      verifyTime: verifyTime ?? this.verifyTime,
      otherOrg: otherOrganization ?? this.otherOrg,
      instituteId: instituteId ?? this.instituteId
    );
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  @override
  String type() {
    return "Domestic Worker";
  }

  factory DomesticWorker.fromJson(Map<String, dynamic> json) => DomesticWorker(
    rwaId: json["rwa_id"],
    verifyTime: json["police_verify_time"]?.toDate(),
    otherOrg: json["other_org"],
    instituteId: json["institute_id"]
  );

  Map<String, dynamic> toJson() => {
    "rwa_id": rwaId,
    "police_verify_time": verifyTime,
    "other_org": otherOrg,
    "institute_id": instituteId
  };
}

class HomeBasedWorker implements Occupation {
  final String artisansId;
  final bool artisansCreditCard;
  final bool industryCard;
  final String otherOrg;

  HomeBasedWorker({this.artisansId, this.artisansCreditCard = false, this.industryCard = false, this.otherOrg});

  HomeBasedWorker copyWith({ String artisanNo, bool artisanCreditCard, bool artisanAadharCard, String otherOrganization }) {
    return HomeBasedWorker(
      artisansId: artisanNo ?? this.artisansId,
      artisansCreditCard: artisanCreditCard ?? this.artisansCreditCard,
      industryCard: artisanAadharCard ?? this.industryCard,
      otherOrg: otherOrganization ?? this.otherOrg,
    );
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  @override
  String type() {
    return "Home Based Worker";
  }

  factory HomeBasedWorker.fromJson(Map<String, dynamic> json) => HomeBasedWorker(
    artisansId: json["artisans_id"],
    artisansCreditCard: json["artisans_credit_card"],
    industryCard: json["industry_card"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "artisans_id": artisansId,
    "artisans_credit_card": artisansCreditCard,
    "industry_card": industryCard,
    "other_org": otherOrg,
  };
}

class RickshawPuller implements Occupation {
  final bool surveyed;
  final String rskwLicence;
  final String otherOrg;

  RickshawPuller({this.surveyed = false, this.rskwLicence, this.otherOrg});

  RickshawPuller copyWith({ bool surveyedLabour, String licenceNo, String otherOrganization }) {
    return RickshawPuller(
      surveyed: surveyedLabour ?? this.surveyed,
      rskwLicence: licenceNo ?? this.rskwLicence,
      otherOrg: otherOrganization ?? this.otherOrg,
    );
  }

  @override
  String type() {
    return "Risckhaw Puller";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  factory RickshawPuller.fromJson(Map<String, dynamic> json) => RickshawPuller(
    surveyed: json["surveyed"],
    rskwLicence: json["rskw_licence"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "surveyed": surveyed,
    "rskw_licence": rskwLicence,
    "other_org": otherOrg,
  };
}

class AgricultureLabour implements Occupation {
  final bool minWageAware;
  final bool minWage;
  final String otherOrg;

  AgricultureLabour({this.minWageAware = false, this.minWage = false, this.otherOrg});

  AgricultureLabour copyWith({ bool minWageAware, bool minWage, String otherOrg }) {
    return AgricultureLabour(
      minWageAware: minWageAware ?? this.minWageAware,
      minWage: minWage ?? this.minWage,
      otherOrg: otherOrg ?? this.otherOrg,
    );
  }

  @override
  String type() {
    return "Agriculture Labour";
  }

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  factory AgricultureLabour.fromJson(Map<String, dynamic> json) => AgricultureLabour(
    minWageAware: json["min_wage_aware"],
    minWage: json["min_wage"],
    otherOrg: json["other_org"],
  );

  Map<String, dynamic> toJson() => {
    "min_wage_aware": minWageAware,
    "min_wage": minWage,
    "other_org": otherOrg,
  };
}

class Others implements Occupation {
  String detail;

  Others({
    this.detail,
  });

  factory Others.fromJson(Map<String, dynamic> json) => Others(
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "detail": detail,
  };

  @override
  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  @override
  String type() {
    return 'Others';
  }
}

class Occupation {

  Occupation() {}

  HashMap<String, dynamic> getMap() {
    HashMap<String, dynamic> _map = HashMap<String, dynamic>();
    return _map;
  }

  factory Occupation.fromSnapShot(String type, Map<String, dynamic> json) {
    if (type.compareTo('street_vendor') == 0) {
      return StreetVendor.fromJson(json);
    } else if (type.compareTo('construction_worker') == 0) {
      return ConstructionWorker.fromJson(json);
    } else if (type.compareTo('waste_picker') == 0) {
      return WastePicker.fromJson(json);
    } else if (type.compareTo('domestic_worker') == 0) {
      return DomesticWorker.fromJson(json);
    } else if (type.compareTo('home_worker') == 0) {
      return HomeBasedWorker.fromJson(json);
    } else if (type.compareTo('rickshaw_puller') == 0) {
      return RickshawPuller.fromJson(json);
    } else if (type.compareTo('agriculture_labour') == 0) {
      return AgricultureLabour.fromJson(json);
    } else {
      return Others.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() => {};

  String type() {
    return "None";
  }
}