import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UnInitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String name;

  const Authenticated(this.name);

  @override
  List<Object> get props => [name];
}

class UnAuthenticated extends AuthenticationState{}
