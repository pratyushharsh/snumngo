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
  final String email;
  final String displayName;
  final String photoUrl;

  const Authenticated({this.email, this.displayName, this.photoUrl});

  @override
  List<Object> get props => [email];
}

class UnAuthenticated extends AuthenticationState{}

class UpdatingUser extends Authenticated {
  final String email;
  final String displayName;
  final String photoUrl;

  UpdatingUser({this.email, this.displayName, this.photoUrl});
}
