import 'package:flutter/material.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/add_person_form.dart';

class AddPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).person_detail),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: Text(S.of(context).personal_info),),
              Tab(child: Text(S.of(context).occupational_detail),),
              Tab(child: Text("Stepper"),),
            ],
          ),
        ),
        body: AddPersonForm(),
      ),
    );
  }
}
