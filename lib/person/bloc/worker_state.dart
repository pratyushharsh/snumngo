import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:snumngo/person/model/person.dart';

@immutable
abstract class WorkerState extends Equatable {
  const WorkerState();

@override
  List<Object> get props => [];
}

class LoadingWorker extends WorkerState {}

class LoadedWorkerSuccess extends WorkerState {
  final Person worker;

  const LoadedWorkerSuccess(this.worker);

  @override
  List<Object> get props => [worker];
}

class LoadingWorkerFailure extends WorkerState {}
