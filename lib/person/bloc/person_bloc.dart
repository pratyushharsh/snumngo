import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';
import './bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  Person person = Person(
      personalInfo: PersonalInfo(),
      address: Address(),
      occupation: Occupation(),
      disability: Disability(),
      panVoterDetail: PanVoterDetail(),
      aadhaarBank: AadharBankDetail());

  updateAddress(Address address) {
    person = person.copyWith(address: address);
  }

  Stream<PersonState> _updatePersonalInfo(PersonalInfoEvent event) async* {
    if (event is UpdateSno) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(sno: event.sno));
    } else if (event is UpdateName) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(name: event.name));
    } else if (event is UpdateMobile) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(mobile: event.mobile));
    } else if (event is UpdateWhatsapp) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(whatsapp: event.whatsapp));
    } else if (event is UpdateGender) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(gender: event.gender));
    } else if (event is UpdateDob) {
      person = person.copyWith(
          personalInfo: person.personalInfo.copyWith(dob: event.dob));
    } else if (event is UpdateFathersName) {
      person = person.copyWith(
          personalInfo:
              person.personalInfo.copyWith(fatherName: event.fatherName));
    } else if (event is UpdateMothersName) {
      person = person.copyWith(
          personalInfo:
              person.personalInfo.copyWith(motherName: event.motherName));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updateAddress(AddressEvent event) async* {
    if (event is UpdateHouseNo) {
      person = person.copyWith(
          address: person.address.copyWith(houseNo: event.houseNo));
    } else if (event is UpdateStreet) {
      person = person.copyWith(
          address: person.address.copyWith(street: event.street));
    } else if (event is UpdateCity) {
      person =
          person.copyWith(address: person.address.copyWith(city: event.city));
    } else if (event is UpdateWard) {
      person =
          person.copyWith(address: person.address.copyWith(ward: event.ward));
    } else if (event is UpdateMunicipal) {
      person = person.copyWith(
          address: person.address.copyWith(municipal: event.municipal));
    } else if (event is UpdateDistrict) {
      person = person.copyWith(
          address: person.address.copyWith(district: event.district));
    } else if (event is UpdatePincode) {
      person = person.copyWith(
          address: person.address.copyWith(pincode: event.pincode));
    } else if (event is UpdateState) {
      person =
          person.copyWith(address: person.address.copyWith(state: event.state));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updateDisabilityEvent(DisabilityEvent event) async* {
    if (event is IsDisableEvent) {
      person = person.copyWith(
          disability: person.disability.copyWith(disable: event.isDisable));
    } else if (event is UpdateDisabilityCertiNo) {
      person = person.copyWith(
          disability:
              person.disability.copyWith(cerificateNo: event.disabilityCerti));
    } else if (event is UpdateDisabilityCertificate) {
      File image = event.certificate;
      person = person.copyWith(
          disability: person.disability.copyWith(certificateUrl: image.path));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updateAadhaarEvent(AadharEvent event) async* {
    if (event is AadharNumberUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(aadhaarNo: event.aadhaarNo));
    } else if (event is AadharUrlFrontUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(frontUrl: event.frontUrl.path));
    } else if (event is AadharUrlBackUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(backUrl: event.backUrl.path));
    } else if (event is AadharBankLinkedUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(bankLinked: event.bankLinked));
    } else if (event is BankNameUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(bankName: event.bankName));
    } else if (event is BankAccountNoUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(accountNumber: event.accountNumber));
    } else if (event is BankIfscUpdate) {
      person = person.copyWith(aadhaarBank: person.aadhaarBank.copyWith(ifscCode: event.ifscCode));
    }
    yield EditingPersonalState(person);
  }

  updateOccupation(Occupation occupation) {
    person = person.copyWith(occupation: occupation);
  }

  @override
  PersonState get initialState => InitialPersonState(person);

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is PersonalInfoEvent) {
      yield* _updatePersonalInfo(event);
    } else if (event is AddressEvent) {
      yield* _updateAddress(event);
    } else if (event is DisabilityEvent) {
      yield* _updateDisabilityEvent(event);
    } else if (event is AadharEvent) {
      yield* _updateAadhaarEvent(event);
    }
  }

}
