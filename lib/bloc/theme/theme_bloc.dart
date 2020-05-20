import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is InitialTheme) {
     yield  ThemeState(
       themeMode: event.themeMode,
       locale: event.locale,
       platform: event.platform,
       isTestMode: event.isTestMode
     );
    }
    if (event is ChangeLocale) {
      yield state.copyWith(locale: event.locale);
    }
    if (event is ChangeThemeMode) {
      yield state.copyWith(themeMode: event.themeMode);
    }
  }
}
