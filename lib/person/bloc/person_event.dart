import 'package:meta/meta.dart';

@immutable
abstract class PersonEvent {}

class UpdateSno extends PersonEvent {
  final String sno;
  UpdateSno(this.sno);
}
