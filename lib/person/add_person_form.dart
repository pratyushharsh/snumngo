import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';

import 'model/person.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {

  int _currentStep = 0;
  Person person = Person();
  int _changed = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      onChanged: () {
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
        title: Text("Personal Detail"),
        content: PersonalInfoWidget(),
        isActive: _currentStep >= 0,
        state: getState(0)
      ),
      Step(
        title: Text("Address Details"),
        content: AddressWidget(),
        isActive: _currentStep >= 1,
          state: getState(1)
      ),
      Step(
          title: Text("Disability Cerificate"),
          content: DisabilityWidget(),
          isActive: _currentStep >= 2,
          state: getState(2)
      ),
      Step(
          title: Text("Aadhaar Detail"),
          content: AadharBankWidget(person: person,),
          isActive: _currentStep >= 3,
          state: getState(3)
      ),
      Step(
          title: Text("Pan Voter"),
          content: PanVoterWidget(),
          isActive: _currentStep >= 4,
          state: getState(4)
      ),
      Step(
          title: Text("Occupation Detail"),
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
