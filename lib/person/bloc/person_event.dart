import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:snumngo/person/model/models.dart';

@immutable
abstract class PersonEvent {}

class PersonalInfoEvent extends PersonEvent{}

class AddNewWorker extends PersonEvent {
  final Worker worker;

  AddNewWorker(this.worker);
}

class UpdateWorker extends PersonEvent {
  final Worker worker;

  UpdateWorker(this.worker);
}

class UpdateWorkerSuccess extends PersonEvent {}

class UpdateSno extends PersonalInfoEvent {
  final String sno;
  UpdateSno(this.sno);
}

class UpdateName extends PersonalInfoEvent {
  final String name;

  UpdateName(this.name);
}

class UpdateMobile extends PersonalInfoEvent {
  final String mobile;

  UpdateMobile(this.mobile);
}

class UpdateWhatsapp extends PersonalInfoEvent {
  final String whatsapp;

  UpdateWhatsapp(this.whatsapp);
}

class UpdateGender extends PersonalInfoEvent {
  final String gender;

  UpdateGender(this.gender);
}

class UpdateDob extends PersonalInfoEvent {
  final DateTime dob;

  UpdateDob(this.dob);
}

class UpdateFathersName extends PersonalInfoEvent {
  final String fatherName;

  UpdateFathersName(this.fatherName);
}

class UpdateMothersName extends PersonalInfoEvent {
  final String motherName;

  UpdateMothersName(this.motherName);
}

class AddressEvent extends PersonEvent {}

class UpdateHouseNo extends AddressEvent {
  final String houseNo;

  UpdateHouseNo(this.houseNo);
}

class UpdateStreet extends AddressEvent {
  final String street;

  UpdateStreet(this.street);
}

class UpdateCity extends AddressEvent {
  final String city;

  UpdateCity(this.city);
}

class UpdateWard extends AddressEvent {
  final String ward;

  UpdateWard(this.ward);
}

class UpdateMunicipal extends AddressEvent {
  final String municipal;

  UpdateMunicipal(this.municipal);
}

class UpdateDistrict extends AddressEvent {
  final String district;

  UpdateDistrict(this.district);
}

class UpdatePincode extends AddressEvent {
  final String pincode;

  UpdatePincode(this.pincode);
}

class UpdateState extends AddressEvent {
  final String state;

  UpdateState(this.state);
}

class DisabilityEvent extends PersonEvent {}

class IsDisableEvent extends DisabilityEvent {
  final bool isDisable;

  IsDisableEvent(this.isDisable);
}

class UpdateDisabilityCertiNo extends DisabilityEvent {
  final String disabilityCerti;

  UpdateDisabilityCertiNo(this.disabilityCerti);
}

class UpdateDisabilityCertificate extends DisabilityEvent {
  final File certificate;

  UpdateDisabilityCertificate(this.certificate);
}

class UpdateDisabilityCertificateUrl extends DisabilityEvent {
  final StorageReference reference;

  UpdateDisabilityCertificateUrl(this.reference);
}

class AadharEvent extends PersonEvent {}

class AadharNumberUpdate extends AadharEvent {
  final String aadhaarNo;

  AadharNumberUpdate(this.aadhaarNo);
}

class AadharUrlFrontUpdate extends AadharEvent {
  final File frontUrl;

  AadharUrlFrontUpdate(this.frontUrl);
}

class AadharUrlBackUpdate extends AadharEvent {
  final File backUrl;

  AadharUrlBackUpdate(this.backUrl);
}

class AadharBankLinkedUpdate extends AadharEvent {
  final bool bankLinked;

  AadharBankLinkedUpdate(this.bankLinked);
}

class BankNameUpdate extends AadharEvent {
  final String bankName;

  BankNameUpdate(this.bankName);
}

class BankAccountNoUpdate extends AadharEvent {
  final String accountNumber;

  BankAccountNoUpdate(this.accountNumber);
}

class BankIfscUpdate extends AadharEvent {
  final String ifscCode;

  BankIfscUpdate(this.ifscCode);
}

class PanVoterEvent extends PersonEvent {}

class UpdatePanCardNo extends PanVoterEvent {
  final String pancard;

  UpdatePanCardNo(this.pancard);
}

class UpdateVoteIdNo extends PanVoterEvent {
  final String voterId;

  UpdateVoteIdNo(this.voterId);
}

class UpdateVoterFrontUrl extends PanVoterEvent {
  final File voterfrontUrl;

  UpdateVoterFrontUrl(this.voterfrontUrl);
}

class UpdateVoterBackUrl extends PanVoterEvent {
  final File voterBackUrl;

  UpdateVoterBackUrl(this.voterBackUrl);
}

class UpdatePanUrl extends PanVoterEvent {
  final File panUrl;

  UpdatePanUrl(this.panUrl);
}

class OccupationEvent extends PersonEvent {}

class UpdateOccupation extends OccupationEvent {
  final Occupation occupation;

  UpdateOccupation(this.occupation);
}

class UploadingImageAndSubmitting extends PersonEvent {}