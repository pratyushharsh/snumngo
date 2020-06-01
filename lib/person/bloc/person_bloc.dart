import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/repository/workers_repo.dart';
import './bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {

  final bool updatingWorker;

  @override
  PersonState get initialState => InitialPersonState(person);

  final WorkersRepository workersRepo;

  Worker person;

  PersonBloc(this.workersRepo, {Worker existingPerson, this.updatingWorker = false})
      : person = existingPerson ??
            Worker(
                personalInfo: WorkerInfo(),
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
    } else if (event is UpdateDisabilityCertificateUrl) {
      Uri url = await event.reference.getDownloadURL();
      person = person.copyWith(
          disability:
              person.disability.copyWith(certificateUrl: url.toString()));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updateAadhaarEvent(AadharEvent event) async* {
    if (event is AadharNumberUpdate) {
      person = person.copyWith(
          aadhaarBank: person.aadhaarBank.copyWith(aadhaarNo: event.aadhaarNo));
    } else if (event is AadharUrlFrontUpdate) {
      person = person.copyWith(
          aadhaarBank:
              person.aadhaarBank.copyWith(frontUrl: event.frontUrl.path));
    } else if (event is AadharUrlBackUpdate) {
      person = person.copyWith(
          aadhaarBank:
              person.aadhaarBank.copyWith(backUrl: event.backUrl.path));
    } else if (event is AadharBankLinkedUpdate) {
      person = person.copyWith(
          aadhaarBank:
              person.aadhaarBank.copyWith(bankLinked: event.bankLinked));
    } else if (event is BankNameUpdate) {
      person = person.copyWith(
          aadhaarBank: person.aadhaarBank.copyWith(bankName: event.bankName));
    } else if (event is BankAccountNoUpdate) {
      person = person.copyWith(
          aadhaarBank:
              person.aadhaarBank.copyWith(accountNumber: event.accountNumber));
    } else if (event is BankIfscUpdate) {
      person = person.copyWith(
          aadhaarBank: person.aadhaarBank.copyWith(ifscCode: event.ifscCode));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updatePanCardDetailEvent(PanVoterEvent event) async* {
    if (event is UpdatePanCardNo) {
      person = person.copyWith(
          panVoterDetail:
              person.panVoterDetail.copyWith(pancard: event.pancard));
    } else if (event is UpdateVoteIdNo) {
      person = person.copyWith(
          panVoterDetail:
              person.panVoterDetail.copyWith(voterCard: event.voterId));
    } else if (event is UpdateVoterFrontUrl) {
      person = person.copyWith(
          panVoterDetail: person.panVoterDetail
              .copyWith(voterUrlFront: event.voterfrontUrl?.path));
    } else if (event is UpdateVoterBackUrl) {
      person = person.copyWith(
          panVoterDetail: person.panVoterDetail
              .copyWith(voterUrlBack: event.voterBackUrl?.path));
    } else if (event is UpdatePanUrl) {
      person = person.copyWith(
          panVoterDetail:
              person.panVoterDetail.copyWith(panUrl: event.panUrl?.path));
    }
    yield EditingPersonalState(person);
  }

  Stream<PersonState> _updateOccupationEvent(Occupation occupation) async* {
    person = person.copyWith(occupation: occupation);
    yield EditingPersonalState(person);
  }

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
    } else if (event is PanVoterEvent) {
      yield* _updatePanCardDetailEvent(event);
    } else if (event is UpdateOccupation) {
      yield* _updateOccupationEvent(event.occupation);
    } else if (event is UploadingImageAndSubmitting) {
      yield FinalUploadAndSubmit(state.person);
    } else if (event is AddNewWorker) {
      yield* _mapAddNewWorker(event);
    }
  }

  Stream<PersonState> _mapAddNewWorker(AddNewWorker event) async* {
    yield AddedNewPersonState(event.worker);
    try {
      await workersRepo.addNewWorker(event.worker);
      yield AddedNewPersonSuccess(event.worker);
    } catch(_) {
      print(_);
      yield AddingNewPersonFailure(event.worker);
    }

  }

  Future<bool> addNewPerson(Worker p) async {
    await workersRepo.addNewWorker(person);
    return true;
  }

  Future<Worker> updateImageUrls({
    StorageReference profileUrl,
    StorageReference disabilityUrl,
    StorageReference aadharFrontUrl,
    StorageReference aadharBackUrl,
    StorageReference panUrl,
    StorageReference voterFrontUrl,
    StorageReference voterBackUrl,
  }) async {
    person = await person.copyWith(
      personalInfo: person.personalInfo.copyWith(profileUrl: modifyUri(await profileUrl?.getDownloadURL())?.toString()),
        disability: person.disability.copyWith(
            certificateUrl:
                modifyUri(await disabilityUrl?.getDownloadURL())?.toString()),
        aadhaarBank: person.aadhaarBank.copyWith(
            frontUrl:
                modifyUri(await aadharFrontUrl?.getDownloadURL())?.toString(),
            backUrl:
                modifyUri(await aadharBackUrl?.getDownloadURL())?.toString()),
        panVoterDetail: person.panVoterDetail.copyWith(
          panUrl: modifyUri(await panUrl?.getDownloadURL())?.toString(),
          voterUrlFront: modifyUri(await voterFrontUrl?.getDownloadURL())?.toString(),
          voterUrlBack: modifyUri(await voterBackUrl?.getDownloadURL())?.toString()
        ));
    return person;
  }


  Uri modifyUri(String s) {
    if (s == null || s.isEmpty) return null;
    Uri uri = Uri.parse(s);
    return uri;
    List<String> paths = uri.pathSegments;
    List<String> newPaths = [];
    for (String t in paths) {
      if (t.endsWith('.jpg')) {
        newPaths.add(t.replaceAll('.jpg', '_400x400.jpg'));
      } else {
        newPaths.add(t);
      }
    }
    return uri.replace(pathSegments: newPaths);
  }
}
