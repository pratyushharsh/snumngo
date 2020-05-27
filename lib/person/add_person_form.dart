import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';
import 'package:snumngo/workers/search/bloc.dart';

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
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
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
              bool val = await BlocProvider.of<PersonBloc>(context).addNewPerson(BlocProvider.of<PersonBloc>(context).person);
              if (val) {
                BlocProvider.of<SearchBloc>(context).add(RefreshSearch());
                Navigator.pop(context);
              }
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
      }
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
          content: Text("Submit Detail"),
          subtitle: Text("Subtitle"))
    ];
    return _steps;
  }
}
