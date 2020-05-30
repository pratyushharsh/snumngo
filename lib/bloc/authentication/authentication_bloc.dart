import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:snumngo/repository/user_repository.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _repository;

  AuthenticationBloc({@required UserRepository repository})
      : assert(repository != null),
        _repository = repository;


  @override
  AuthenticationState get initialState => UnInitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedStated();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    } else if (event is UpdateUserDisplayName) {
      yield* _mapUpdateUserDisplayName(event.displayName);
    }
  }

  Stream<AuthenticationState> _mapAppStartedStated() async* {
    try {
      bool signedin = await _repository.isSignedIn();
      if (signedin) {
        yield* _mapLoggedInToState();
      } else {
        yield UnAuthenticated();
      }
    } catch (_) {
      print(_);
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    FirebaseUser user = await _repository.getUser();
    yield Authenticated(email: user.email, displayName: user.displayName, photoUrl: user.photoUrl);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    await _repository.signOut();
    yield UnAuthenticated();
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _repository.getUser();
    return user.email;
  }

  Stream<AuthenticationState> _mapUpdateUserDisplayName(String displayName) async* {
    FirebaseUser user = await _repository.getUser();
    yield UpdatingUser(email: user.email, displayName: user.displayName, photoUrl: user.photoUrl);
    await _repository.updateUser(username: displayName);
    yield* _mapLoggedInToState();
  }

}
