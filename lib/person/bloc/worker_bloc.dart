import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:snumngo/repository/workers_repo.dart';
import './bloc.dart';

class WorkerBloc extends Bloc<WorkerEvent, WorkerState> {

  final WorkersRepository _wkrRepo;
  WorkerBloc(this._wkrRepo);

  @override
  WorkerState get initialState => LoadingWorker();

  @override
  Stream<WorkerState> mapEventToState(
    WorkerEvent event,
  ) async* {
    if (event is LoadWorker) {
      yield LoadingWorker();
      await Future.delayed(Duration(seconds: 2));
      yield LoadedWorkerSuccess(_wkrRepo.getAllWorker());
    }
  }
}
