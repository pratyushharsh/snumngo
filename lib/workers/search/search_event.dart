import 'package:meta/meta.dart';
import 'package:snumngo/person/model/models.dart';

@immutable
abstract class SearchEvent {}

class RefreshSearch extends SearchEvent {}

class StartSearch extends SearchEvent {}

class SearchData extends SearchEvent {}

class SearchSuccess extends SearchEvent {
  final List<Worker> workers;

  SearchSuccess(this.workers);
}