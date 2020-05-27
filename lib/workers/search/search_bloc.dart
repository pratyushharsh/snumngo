import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:snumngo/repository/workers_repo.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final WorkersRepository _wrksRepo;

  SearchBloc(this._wrksRepo);

  @override
  SearchState get initialState => InitialSearchState(_wrksRepo.getAllWorker());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is RefreshSearch) {
      yield InitialSearchState(_wrksRepo.getAllWorker());
    }
  }
}
