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
  final List<Person> workers;

  const LoadedWorkerSuccess(this.workers);

  @override
  List<Object> get props => [workers];
}

class LoadingWorkerFailure extends WorkerState {}
