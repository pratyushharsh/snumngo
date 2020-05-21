import 'package:flutter/material.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';

import 'model/person.dart';

class AddPersonForm extends StatelessWidget {

  Person person;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TabBarView(
        children: <Widget>[PersonalDetail(), OccupationalDetail()],
      ),
    );
  }
}