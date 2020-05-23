import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class WorkersBloc extends Bloc<WorkersEvent, WorkersState> {
  @override
  WorkersState get initialState => InitialWorkersState();

  @override
  Stream<WorkersState> mapEventToState(
    WorkersEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
