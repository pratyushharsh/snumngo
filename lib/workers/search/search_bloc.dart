import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:snumngo/repository/workers_repo.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final WorkersRepository _wrksRepo;

  SearchBloc(this._wrksRepo);

  StreamSubscription _workersSubscription;

  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is RefreshSearch) {
      yield InitialSearchState();
    } else if (event is StartSearch) {
      yield* _mapSuccessSearch();
    } else if (event is SearchSuccess) {
      yield SearchingWorkersSuccess(event.workers);
    }
  }

  Stream<SearchState> _mapSuccessSearch() async* {
    try {
      _workersSubscription?.cancel();
      _workersSubscription = _wrksRepo.getAllWorker().listen((wks) => add(SearchSuccess(wks)));
    } catch (_) {
      yield SearchFailure();
    }
  }

  @override
  Future<void> close() {
    _workersSubscription?.cancel();
    return super.close();
  }
}
