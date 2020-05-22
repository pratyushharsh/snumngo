import 'package:flutter/material.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/add_person_form.dart';

class AddPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).person_detail),
      ),
      body: AddPersonForm(),
    );
  }
}
