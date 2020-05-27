import 'package:meta/meta.dart';
import 'package:snumngo/person/model/models.dart';

@immutable
abstract class SearchState {
  final List<Person> person;

  SearchState(this.person);
}

class InitialSearchState extends SearchState {
  InitialSearchState(List<Person> person) : super(person);
}
