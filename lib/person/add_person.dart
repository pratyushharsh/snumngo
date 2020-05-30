import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/add_person_form.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';

class AddPerson extends StatelessWidget {

  final Person person;

  const AddPerson({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).person_detail),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PersonBloc>(
            create: (BuildContext context) => PersonBloc(RepositoryProvider.of(context), existingPerson: person),
          ),
          BlocProvider<WorkerImageBloc>(create: (BuildContext context) => WorkerImageBloc(
            cloudStorageRepository: RepositoryProvider.of(context)
          ),
          )
        ],
        child: AddPersonForm(),
      )
    );
  }
}
