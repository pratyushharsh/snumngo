import 'package:meta/meta.dart';
import 'package:snumngo/person/model/person.dart';

@immutable
abstract class PersonState {
  final Worker person;
  PersonState(this.person);
}

class InitialPersonState extends PersonState {
  InitialPersonState(Worker person) : super(person);
}

class EditingPersonalState extends PersonState {
  EditingPersonalState(Worker person) : super(person);
}

class AddedNewPersonState extends PersonState {
  AddedNewPersonState(Worker person) : super(person);
}

class AddedNewPersonSuccess extends PersonState {
  AddedNewPersonSuccess(Worker person) : super(person);
}

class AddingNewPersonFailure extends PersonState {
  AddingNewPersonFailure(Worker person) : super(person);
}

class FinalUploadAndSubmit extends PersonState {
  FinalUploadAndSubmit(Worker person) : super(person);
}