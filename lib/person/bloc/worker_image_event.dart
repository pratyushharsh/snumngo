import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class WorkerImageEvent extends Equatable {
  const WorkerImageEvent();

  @override
  List<Object> get props => [];
}

class UploadProfileUrl extends WorkerImageEvent {
  final File profile;

  UploadProfileUrl(this.profile);
}

class UploadDisabilityCertificate extends WorkerImageEvent {
  final File fileUrl;

  UploadDisabilityCertificate(this.fileUrl);
}

class UploadAadhaarFront extends WorkerImageEvent {
  final File fileUrl;

  UploadAadhaarFront(this.fileUrl);
}

class UploadAadhaarBack extends WorkerImageEvent {
  final File fileUrl;

  UploadAadhaarBack(this.fileUrl);

}

class UploadPancard extends WorkerImageEvent {

}

class UploadVoterFront extends WorkerImageEvent {

}

class UploadVoterBack extends WorkerImageEvent {

}

class WorkerUploadImageSuccess extends WorkerImageEvent {}