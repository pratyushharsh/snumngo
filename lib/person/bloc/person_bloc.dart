import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  @override
  PersonState get initialState => InitialPersonState();

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
