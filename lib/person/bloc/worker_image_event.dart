import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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

class DeleteUrlEvent extends WorkerImageEvent {
  final String imageUrl;

  DeleteUrlEvent(this.imageUrl);
}

class DeleteProfileUrl extends DeleteUrlEvent {
  DeleteProfileUrl(String imageUrl) : super(imageUrl);
}

class DeleteDisabilityCertificateUrl extends DeleteUrlEvent {
  DeleteDisabilityCertificateUrl(String imageUrl) : super(imageUrl);
}

class DeleteAadharFrontUrl extends DeleteUrlEvent{
  DeleteAadharFrontUrl(String imageUrl) : super(imageUrl);
}

class DeleteAadharBackUrl extends DeleteUrlEvent {
  DeleteAadharBackUrl(String imageUrl) : super(imageUrl);
}

class DeletePanCardUrl extends DeleteUrlEvent {
  DeletePanCardUrl(String imageUrl) : super(imageUrl);
}

class DeleteVoterFrontUrl extends DeleteUrlEvent {
  DeleteVoterFrontUrl(String imageUrl) : super(imageUrl);
}

class DeleteVoterBackUrl extends DeleteUrlEvent {
  DeleteVoterBackUrl(String imageUrl) : super(imageUrl);
}