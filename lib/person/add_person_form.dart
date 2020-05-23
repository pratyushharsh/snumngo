import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';

import 'model/person.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _currentStep = 0;
  Person person = Person();
  int _changed = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () {
        _formKey.currentState;
        print("${_changed++}");
      },
      child: Stepper(
        physics: ClampingScrollPhysics(),
        steps: _mySteps(person),
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            print(BlocProvider.of<PersonBloc>(context).person.toString());
            _currentStep = _currentStep + 1 < _mySteps(person).length ? _currentStep + 1 : _mySteps(person).length - 1;
          });
        },
        onStepCancel: () {
          setState(() {
            print(_currentStep);
            _currentStep = _currentStep - 1 >= 0 ? _currentStep - 1 : 0;
          });
        },
      ),
    );
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

  List<Step> _mySteps(Person person) {
    List<Step> _steps = [
      Step(
        title: Text(S.of(context).personal_detail),
        content: PersonalInfoWidget(),
        isActive: _currentStep >= 0,
        state: getState(0)
      ),
      Step(
        title: Text(S.of(context).address_detail),
        content: AddressWidget(),
        isActive: _currentStep >= 1,
          state: getState(1)
      ),
      Step(
          title: Text(S.of(context).disability),
          content: DisabilityWidget(),
          isActive: _currentStep >= 2,
          state: getState(2)
      ),
      Step(
          title: Text(S.of(context).aadhar_detail),
          content: AadharBankWidget(),
          isActive: _currentStep >= 3,
          state: getState(3)
      ),
      Step(
          title: Text(S.of(context).pan_voter_detail),
          content: PanVoterWidget(),
          isActive: _currentStep >= 4,
          state: getState(4)
      ),
      Step(
          title: Text(S.of(context).occupational_detail),
          content: OccupationalDetail(),
          isActive: _currentStep >= 5,
          state: getState(5)
      ),
      Step(
        title: Text("Finish and Upload"),
        content: Text("Submit Detail"),
        subtitle: Text("Subtitle")
      )
    ];
    return _steps;
  }
}
