import 'package:flutter/material.dart';
import 'package:snumngo/person/occupation_detail.dart';
import 'package:snumngo/person/personal_detail.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        print("changed");
      },
      child: TabBarView(
        children: <Widget>[PersonalDetail(), OccupationalDetail()],
      ),
    );
  }
}