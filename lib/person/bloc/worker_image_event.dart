import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class WorkerImageEvent extends Equatable {
  const WorkerImageEvent();

  @override
  List<Object> get props => [];
}

class StartUploadingImages extends WorkerImageEvent{}

class UploadProfileUrl extends WorkerImageEvent {
  final File fileUrl;

  UploadProfileUrl(this.fileUrl);
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
  final File fileUrl;

  UploadPancard(this.fileUrl);
}

class UploadVoterFront extends WorkerImageEvent {
  final File fileUrl;

  UploadVoterFront(this.fileUrl);
}

class UploadVoterBack extends WorkerImageEvent {
  final File fileUrl;

  UploadVoterBack(this.fileUrl);
}

class WorkerUploadImageSuccess extends WorkerImageEvent {}