import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/add_person_form.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';

class AddPerson extends StatelessWidget {

  final Worker person;
  final bool updateMode;

  const AddPerson({Key key, this.person, this.updateMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).person_detail),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PersonBloc>(
            create: (BuildContext context) => PersonBloc(RepositoryProvider.of(context), existingPerson: person, updatingWorker: updateMode),
          ),
          BlocProvider<WorkerImageBloc>(create: (BuildContext context) => WorkerImageBloc(
            personBloc: BlocProvider.of(context),
            cloudStorageRepository: RepositoryProvider.of(context)
          ),
          )
        ],
        child: AddPersonForm(),
      )
    );
  }
}
