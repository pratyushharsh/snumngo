import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:snumngo/repository/cloud_storage.dart';
import './bloc.dart';

class WorkerImageBloc extends Bloc<WorkerImageEvent, WorkerImageState> {

  final CloudStorageRepository cloudStorageRepository;

  WorkerImageBloc({@required this.cloudStorageRepository});

  @override
  WorkerImageState get initialState => InitialWorkerImageState(UploadImageStatus());

  @override
  Stream<WorkerImageState> mapEventToState(
    WorkerImageEvent event,
  ) async* {
    if (event is UploadProfileUrl) {

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

    } else if (event is UploadVoterFront) {

    } else if (event is UploadVoterBack) {

    }
  }
}
