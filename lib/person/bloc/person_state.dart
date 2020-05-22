import 'package:meta/meta.dart';
import 'package:snumngo/person/model/address.dart';
import 'package:snumngo/person/model/occupation.dart';
import 'package:snumngo/person/model/person.dart';

@immutable
abstract class PersonState {
  final Person person;
  PersonState(this.person);
}

class InitialPersonState extends PersonState {
  InitialPersonState(Person person) : super(person);

}

class EditingPersonalState extends PersonState {
  EditingPersonalState(Person person) : super(person);
}
