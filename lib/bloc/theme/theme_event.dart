import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialTheme extends ThemeEvent {
  final ThemeMode themeMode;
  final Locale locale;
  final TargetPlatform platform;
  final bool isTestMode;

  InitialTheme({this.themeMode, this.locale, this.platform, this.isTestMode});
}

class ChangeLocale extends ThemeEvent {
  final Locale locale;
  ChangeLocale({this.locale});

  @override
  List<Object> get props => [locale];
}

class ChangeThemeMode extends ThemeEvent {
  final ThemeMode themeMode;

  ChangeThemeMode({this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
