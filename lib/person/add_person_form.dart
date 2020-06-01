import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';

import 'bloc/bloc.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  GlobalKey<FormState> _personalFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _disabilityFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _aadharFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _panVoterFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _occupationFormKey = GlobalKey<FormState>();

  int _currentStep = 0;

  _showAddNewDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Create Worker'),
        content: Text('Do You Want To Create a New Worker'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Yes'),
          )
        ],
      );
    }).then((value) {
      if (value != null && value) {
        // Add Image and upload
        _onSuccess();
      }
    });
  }

  _showUpdateDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Worker'),
        content: Text('Do You Want To Update the Worker'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Yes'),
          )
        ],
      );
    }).then((value) {
      if (value != null && value) {

      }
    });
  }

  _onSuccess() {
    Worker p = BlocProvider.of<PersonBloc>(context).person;

    WorkerImageBloc wib = BlocProvider.of(context);
    if (p.aadhaarBank.frontUrl != null &&
        p.aadhaarBank.frontUrl.isNotEmpty) {
      Uri uri = Uri.tryParse(p.aadhaarBank.frontUrl);
      if (uri.isAbsolute) {

      }
      wib.add(UploadAadhaarFront(File(p.aadhaarBank.frontUrl)));
    }

    if (p.aadhaarBank.backUrl != null &&
        p.aadhaarBank.backUrl.isNotEmpty) {
      Uri uri = Uri.tryParse(p.aadhaarBank.backUrl);
      if (uri.isAbsolute) {

      }
      wib.add(UploadAadhaarBack(File(p.aadhaarBank.backUrl)));
    }

    if (p.disability.certificateUrl != null &&
        p.disability.certificateUrl.isNotEmpty) {
      Uri uri = Uri.tryParse(p.disability.certificateUrl);
      if (uri.isAbsolute) {

      }
      wib.add(UploadDisabilityCertificate(File(p.disability.certificateUrl)));
    }

    if (p.panVoterDetail.panUrl != null &&
        p.panVoterDetail.panUrl.isNotEmpty) {
      Uri uri = Uri.tryParse(p.panVoterDetail.panUrl);
      if (uri.isAbsolute) {

      }
      wib.add(UploadPancard(File(p.panVoterDetail.panUrl)));
    }

    if (p.panVoterDetail.voterUrlFront != null &&
        p.panVoterDetail.voterUrlFront.isNotEmpty) {
      Uri uri = Uri.tryParse(p.panVoterDetail.voterUrlFront);
      if (uri.isAbsolute) {
        wib.add(DeleteVoterFrontUrl(p.panVoterDetail.voterUrlFront));
      }
      wib.add(
          UploadVoterFront(File(p.panVoterDetail.voterUrlFront)));
    }

    if (p.panVoterDetail.voterUrlBack != null &&
        p.panVoterDetail.voterUrlBack.isNotEmpty) {
      Uri uri = Uri.tryParse(p.panVoterDetail.voterUrlBack);
      if (uri.isAbsolute) {
        wib.add(DeleteVoterBackUrl(p.panVoterDetail.voterUrlBack));
      }
      wib.add(
          UploadVoterBack(File(p.panVoterDetail.voterUrlBack)));
    }

    if (p.personalInfo.profileUrl != null &&
    p.personalInfo.profileUrl.isNotEmpty) {
      Uri uri = Uri.tryParse(p.personalInfo.profileUrl);
      if (uri.isAbsolute) {
        wib.add(DeleteProfileUrl(p.personalInfo.profileUrl));
      }
      wib.add(UploadProfileUrl(File(p.personalInfo.profileUrl)));
    }

    if ((p.aadhaarBank.frontUrl == null || p.aadhaarBank.frontUrl.isEmpty) &&
        (p.aadhaarBank.backUrl == null || p.aadhaarBank.backUrl.isEmpty) &&
        (p.disability.certificateUrl == null || p.disability.certificateUrl.isEmpty) &&
        (p.panVoterDetail.panUrl == null || p.panVoterDetail.panUrl.isEmpty) &&
        (p.panVoterDetail.voterUrlFront == null || p.panVoterDetail.voterUrlFront.isEmpty) &&
        (p.panVoterDetail.voterUrlBack == null || p.panVoterDetail.voterUrlBack.isEmpty) &&
        (p.personalInfo.profileUrl == null || p.personalInfo.profileUrl.isEmpty)) {
      wib.add(StartUploadingImages());
    }

    BlocProvider.of<PersonBloc>(context).add(UploadingImageAndSubmitting());
  }

  _onContinueFunction() {
    print('Mode Operating ${BlocProvider.of<PersonBloc>(context).updatingWorker}');
    if (_currentStep == 6) {
      bool editMode = BlocProvider.of<PersonBloc>(context).updatingWorker;
      if (editMode != null && editMode) {
        _showUpdateDialog();
      } else {
        _showAddNewDialog();
      }
    }

    if (validForms()) {
      setState(() {
        _currentStep = _currentStep + 1 < _mySteps().length
            ? _currentStep + 1
            : _mySteps().length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<PersonBloc, PersonState>(
      listener: (context, state) {
        if (state is AddedNewPersonState) {
          Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('Adding......'), CircularProgressIndicator()],
                  ),
                )
              );
        }

        if (state is AddingNewPersonFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('Fail To Add New Worker'), Icon(Icons.error)],
                  ),
                  backgroundColor: Colors.red,
                )
            );
        }

        if (state is AddedNewPersonSuccess) {
          Navigator.pop(context);
        }

      },
      child: BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
        return Stepper(
          physics: ClampingScrollPhysics(),
          steps: _mySteps(),
          currentStep: this._currentStep,
          onStepTapped: (state is FinalUploadAndSubmit)
              ? null
              : (step) {
                  setState(() {
                    _currentStep = step;
                  });
                },
          onStepContinue: !(state is FinalUploadAndSubmit)
              ? _onContinueFunction : null,
          onStepCancel: (state is FinalUploadAndSubmit)
              ? null
              : () {
                  setState(() {
                    _currentStep = _currentStep - 1 >= 0 ? _currentStep - 1 : 0;
                  });
                },
        );
      }),
    );
  }

  bool validForms() {
    switch (_currentStep) {
      case 0:
        return _personalFormKey.currentState.validate();
      case 1:
        return _addressFormKey.currentState.validate();
      case 2:
        return _disabilityFormKey.currentState.validate();
      case 3:
        return _aadharFormKey.currentState.validate();
      case 4:
        return _panVoterFormKey.currentState.validate();
      case 5:
        return _occupationFormKey.currentState.validate();
    }
    return true;
  }

  StepState getState(int idx) {
    if (_currentStep == idx) {
      return StepState.editing;
    } else if (idx < _currentStep) {
      return StepState.complete;
    } else {
      return StepState.disabled;
    }
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          title: Text(S.of(context).personal_detail),
          content: Form(
            key: _personalFormKey,
            child: PersonalInfoWidget(),
          ),
          isActive: _currentStep >= 0,
          state: getState(0)),
      Step(
          title: Text(S.of(context).address_detail),
          content: Form(
            key: _addressFormKey,
            child: AddressWidget(),
          ),
          isActive: _currentStep >= 1,
          state: getState(1)),
      Step(
          title: Text(S.of(context).disability),
          content: Form(
            key: _disabilityFormKey,
            child: DisabilityWidget(),
          ),
          isActive: _currentStep >= 2,
          state: getState(2)),
      Step(
          title: Text(S.of(context).aadhar_detail),
          content: Form(
            key: _aadharFormKey,
            child: AadharBankWidget(),
          ),
          isActive: _currentStep >= 3,
          state: getState(3)),
      Step(
          title: Text(S.of(context).pan_voter_detail),
          content: Form(
            autovalidate: true,
            key: _panVoterFormKey,
            child: PanVoterWidget(),
          ),
          isActive: _currentStep >= 4,
          state: getState(4)),
      Step(
          title: Text(S.of(context).occupational_detail),
          content: Form(
            key: _occupationFormKey,
            child: OccupationalDetail(),
          ),
          isActive: _currentStep >= 5,
          state: getState(5)),
      Step(
          title: Text("Finish and Upload"),
          content: ImageUpload(),
          subtitle: Text("Subtitle"))
    ];
    return _steps;
  }
}

class ImageUpload extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerImageBloc, WorkerImageState>(
        builder: (context, state) {
      var s = state.uploadImageStatus;

      if (state is AllImageUploaded) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[Text('All Done'), CircularProgressIndicator()],
          ),
        );
      }

      return Container(
        child: Column(
          children: <Widget>[
            s.disability != null
                ? MyLinearProgressIndicator(
                    title: "Disability Certificate",
                    task: s.disability,
                  )
                : Container(),
            s.aadharFront != null
                ? MyLinearProgressIndicator(
                    title: "Aadhaar Front",
                    task: s.aadharFront,
                  )
                : Container(),
            s.aadhaarBack != null
                ? MyLinearProgressIndicator(
                    title: "Aadhaar Back",
                    task: s.aadhaarBack,
                  )
                : Container(),
            s.pancard != null
                ? MyLinearProgressIndicator(
                    title: "Pancard Upload",
                    task: s.pancard,
                  )
                : Container(),
            s.voterFront != null
                ? MyLinearProgressIndicator(
                    title: 'Voter Id Front',
                    task: s.voterFront,
                  )
                : Container(),
            s.voterBack != null
                ? MyLinearProgressIndicator(
                    title: 'Voter Id Back',
                    task: s.voterBack,
                  )
                : Container()
          ],
        ),
      );
    });
  }
}

class MyLinearProgressIndicator extends StatelessWidget {
  final StorageUploadTask task;
  final String title;

  const MyLinearProgressIndicator({Key key, @required this.task, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (context, snapshot) {
        var event = snapshot?.data?.snapshot;
        double percent =
            event != null ? event.bytesTransferred / event.totalByteCount : 0;

        if (task.isInProgress) {
          return Column(
            children: <Widget>[
              Text(title),
              LinearProgressIndicator(
                value: percent,
              )
            ],
          );
        }

        if (task.isSuccessful) {
          BlocProvider.of<WorkerImageBloc>(context)
              .add(WorkerUploadImageSuccess());
          return Row(
            children: <Widget>[
              Text(title),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.done_all,
                color: Colors.green,
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}