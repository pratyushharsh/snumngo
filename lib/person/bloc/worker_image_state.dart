import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class WorkerImageState extends Equatable {
  final UploadImageStatus uploadImageStatus;
  const WorkerImageState(this.uploadImageStatus);
  @override
  List<Object> get props => [uploadImageStatus];
}

class InitialWorkerImageState extends WorkerImageState {
  InitialWorkerImageState(UploadImageStatus uploadImageStatus) : super(uploadImageStatus);

}

class UploadingState extends WorkerImageState {
  UploadingState(UploadImageStatus uploadImageStatus) : super(uploadImageStatus);
}

class UploadImageStatus {
  final StorageUploadTask profile;
  final StorageUploadTask disability;
  final StorageUploadTask aadharFront;
  final StorageUploadTask aadhaarBack;
  final StorageUploadTask pancard;
  final StorageUploadTask voterFront;
  final StorageUploadTask voterBack;
  final StorageReference profileUrl;
  final StorageReference disabilityUrl;
  final StorageReference aadharFrontUrl;
  final StorageReference aadhaarBackUrl;
  final StorageReference pancardUrl;
  final StorageReference voterFrontUrl;
  final StorageReference voterBackUrl;

  UploadImageStatus({this.profile, this.disability, this.aadharFront, this.aadhaarBack, this.pancard, this.voterFront, this.voterBack, this.profileUrl, this.disabilityUrl, this.aadharFrontUrl, this.aadhaarBackUrl, this.pancardUrl, this.voterFrontUrl, this.voterBackUrl});

  UploadImageStatus copyWith({ StorageUploadTask profile, StorageUploadTask disability, StorageUploadTask aadharFront, StorageUploadTask aadhaarBack, StorageUploadTask pancard, StorageUploadTask voterFront, StorageUploadTask voterBack, StorageReference profileUrl, StorageReference disabilityUrl, StorageReference aadharFrontUrl, StorageReference aadhaarBackUrl, StorageReference pancardUrl, StorageReference voterFrontUrl, StorageReference voterBackUrl }) {
    return UploadImageStatus(
      profile: profile ?? this.profile,
      disability: disability ?? this.disability,
      aadharFront: aadharFront ?? this.aadharFront,
      aadhaarBack: aadhaarBack ?? this.aadhaarBack,
      pancard: pancard ?? this.pancard,
      voterFront: voterFront ?? this.voterFront,
      voterBack: voterBack ?? this.voterBack,
      profileUrl: profileUrl ?? this.profileUrl,
      disabilityUrl: disabilityUrl ?? this.disabilityUrl,
      aadharFrontUrl: aadharFrontUrl ?? this.aadharFrontUrl,
      aadhaarBackUrl: aadhaarBackUrl ?? this.aadhaarBackUrl,
      pancardUrl: pancardUrl ?? this.pancardUrl,
      voterFrontUrl: voterFrontUrl ?? this.voterFrontUrl,
      voterBackUrl: voterBackUrl ?? this.voterBackUrl,
    );
  }
}
