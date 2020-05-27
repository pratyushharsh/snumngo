import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {}

class RefreshSearch extends SearchEvent {}

class StartSearch extends SearchEvent {}

class SearchData extends SearchEvent {}

