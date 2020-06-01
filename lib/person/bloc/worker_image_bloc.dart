import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:snumngo/repository/cloud_storage.dart';
import './bloc.dart';

class WorkerImageBloc extends Bloc<WorkerImageEvent, WorkerImageState> {

  final CloudStorageRepository cloudStorageRepository;
  final PersonBloc _personBloc;

  WorkerImageBloc({@required this.cloudStorageRepository, PersonBloc personBloc}) : _personBloc = personBloc;

  @override
  WorkerImageState get initialState => InitialWorkerImageState(UploadImageStatus());

  @override
  Stream<WorkerImageState> mapEventToState(
    WorkerImageEvent event,
  ) async* {
    if (event is WorkerUploadImageSuccess) {
      yield UploadingState(state.uploadImageStatus);
    } else if (event is UploadProfileUrl) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(profile: res['task'], profileUrl: res['storageRef']));
    } else if (event is UploadDisabilityCertificate) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(disability: res['task'], disabilityUrl: res['storageRef']));
    } else if (event is UploadAadhaarFront) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(aadharFront: res['task'], aadharFrontUrl: res['storageRef']));
    } else if (event is UploadAadhaarBack) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(aadhaarBack: res['task'], aadhaarBackUrl: res['storageRef']));
    } else if (event is UploadPancard) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(pancard: res['task'], pancardUrl: res['storageRef']));
    } else if (event is UploadVoterFront) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(voterFront: res['task'], voterFrontUrl: res['storageRef']));
    } else if (event is UploadVoterBack) {
      Map<String, dynamic> res = cloudStorageRepository.uploadImage(image: event.fileUrl);
      yield UploadingState(state.uploadImageStatus.copyWith(voterBack: res['task'], voterBackUrl: res['storageRef']));
    }

    yield* _mapAllImageUploaded();
  }

  Stream<WorkerImageState> _mapAllImageUploaded() async* {
    UploadImageStatus s = state.uploadImageStatus;
    if ((s.disability != null ? s.disability.isSuccessful : true) &&
        (s.aadharFront != null ? s.aadharFront.isSuccessful : true) &&
        (s.aadhaarBack != null ? s.aadhaarBack.isSuccessful : true) &&
        (s.voterFront != null ? s.voterFront.isSuccessful : true) &&
        (s.voterBack != null ? s.voterBack.isSuccessful : true) &&
        (s.pancard != null ? s.pancard.isSuccessful : true)) {

      var s = state.uploadImageStatus;
      _personBloc.updateImageUrls(
          disabilityUrl: s.disabilityUrl,
          aadharBackUrl: s.aadhaarBackUrl,
          aadharFrontUrl: s.aadharFrontUrl,
          panUrl: s.pancardUrl,
          profileUrl: s.profileUrl,
          voterFrontUrl: s.voterFrontUrl,
          voterBackUrl: s.voterBackUrl)
          .then((value) => _personBloc.add(AddNewWorker(value)));

      yield AllImageUploaded(state.uploadImageStatus);
    }
  }
}
