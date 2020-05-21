import 'package:flutter/material.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';


class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Stepper(
        physics: ClampingScrollPhysics(),
        steps: _mySteps(),
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

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text("Personal Detail"),
        content: PersonalInfoWidget(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Address"),
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
          content: AadharWidget(),
          isActive: _currentStep >= 3
      ),
      Step(
          title: Text("Pan Voter"),
          content: VoterWidget(),
          isActive: _currentStep >= 3
      ),
      Step(
        title: Text("Occupation Detail"),
        content: OccupationalDetail(),
        isActive: _currentStep >= 2,
      ),
    ];
    return _steps;
  }
}
