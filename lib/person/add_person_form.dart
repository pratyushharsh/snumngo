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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
      return Stepper(
        physics: ClampingScrollPhysics(),
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () async {
          if (_currentStep == 6) {
            // Disable Button
            Person p = BlocProvider.of<PersonBloc>(context).person;

            WorkerImageBloc wib = BlocProvider.of(context);
            if (p.aadhaarBank.frontUrl != null &&
                p.aadhaarBank.frontUrl.isNotEmpty) {
              wib.add(UploadAadhaarFront(File(p.aadhaarBank.frontUrl)));
            }

            if (p.aadhaarBank.backUrl != null &&
                p.aadhaarBank.backUrl.isNotEmpty) {
              wib.add(UploadAadhaarBack(File(p.aadhaarBank.backUrl)));
            }

            if (p.disability.certificateUrl != null &&
                p.disability.certificateUrl.isNotEmpty) {
              wib.add(UploadDisabilityCertificate(
                  File(p.disability.certificateUrl)));
            }

//            bool val =
////                await BlocProvider.of<PersonBloc>(context).addNewPerson(p);
//            if (val) {
//              BlocProvider.of<SearchBloc>(context).add(RefreshSearch());
//              Navigator.pop(context);
//            }
          }

          if (validForms()) {
            setState(() {
              _currentStep = _currentStep + 1 < _mySteps().length
                  ? _currentStep + 1
                  : _mySteps().length - 1;
            });
          }
        },
        onStepCancel: () {
          setState(() {
            _currentStep = _currentStep - 1 >= 0 ? _currentStep - 1 : 0;
          });
        },
      );
    });
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
      UploadImageStatus status = state.uploadImageStatus;
      return Container(
        child: Column(
          children: <Widget>[
            status.disability != null
                ? MyLinearProgressIndicator(
                    title: "Disability Certificate",
                    task: status.disability,
                    ref: status.disabilityUrl,
                  )
                : Container(),
            status.aadharFront != null
                ? MyLinearProgressIndicator(
                    title: "Aadhaar Front",
                    task: status.aadharFront,
                    ref: status.aadharFrontUrl,
                  )
                : Container(),
            status.aadhaarBack != null
                ? MyLinearProgressIndicator(
                    title: "Aadhaar Back",
                    task: status.aadhaarBack,
                    ref: status.aadhaarBackUrl,
                  )
                : Container(),
            status.pancard != null
                ? MyLinearProgressIndicator(
                    title: "Pancard Upload",
                    task: status.pancard,
                  )
                : Container()
          ],
        ),
      );
    });
  }
}

class MyLinearProgressIndicator extends StatelessWidget {
  final StorageReference ref;
  final StorageUploadTask task;
  final String title;

  const MyLinearProgressIndicator(
      {Key key, @required this.task, this.title, this.ref})
      : super(key: key);

  _printUrl(StorageReference ref) async {
    var t = await ref.getDownloadURL();
    print(t);
  }

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

          if (task.isComplete) {
            _printUrl(ref);
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
        });
  }
}
