import 'package:meta/meta.dart';
import 'package:snumngo/person/model/address.dart';
import 'package:snumngo/person/model/occupation.dart';
import 'package:snumngo/person/model/person.dart';

@immutable
abstract class PersonState {}

class InitialPersonState extends PersonState {}
