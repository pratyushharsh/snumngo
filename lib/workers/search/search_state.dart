import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:snumngo/person/model/models.dart';

@immutable
abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class InitialSearchState extends SearchState {}

class LoadSearchState extends SearchState {}

class SearchingWorkersSuccess extends SearchState {
  final List<Worker> workers;

  SearchingWorkersSuccess(this.workers);

  @override
  // TODO: implement props
  List<Object> get props => [workers];
}

class SearchFailure extends SearchState {}