import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
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

        },
        onStepCancel: () {

        },
      ),
    );
  }

  List<Step> _mySteps(Person person) {
    List<Step> _steps = [
      Step(
        title: Text("Personal Detail"),
        content: PersonalInfoWidget(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Address Details"),
        content: AddressWidget(),
        isActive: _currentStep >= 1,
      ),
      Step(
          title: Text("Disability Cerificate"),
          content: DisabilityWidget(),
          isActive: _currentStep >= 3
      ),
      Step(
          title: Text("Aadhaar Detail"),
          content: AadharBankWidget(person: person,),
          isActive: _currentStep >= 3
      ),
      Step(
          title: Text("Pan Voter"),
          content: PanVoterWidget(),
          isActive: _currentStep >= 3
      ),
      Step(
        title: Text("Occupation Detail"),
        content: OccupationalDetail(),
        isActive: _currentStep >= 2,
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
