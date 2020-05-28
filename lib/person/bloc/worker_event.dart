import 'package:meta/meta.dart';

@immutable
abstract class WorkerEvent {}

class LoadWorker extends WorkerEvent {
  final String sno;

  LoadWorker(this.sno);
}