import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ThemeState {
  final ThemeMode themeMode;
  final double _textScaleFactor;
  final Locale _locale;
  final TargetPlatform platform;
  final bool isTestMode;

  const ThemeState({
    this.themeMode,
    double textScaleFactor,
    Locale locale,
    this.platform,
    this.isTestMode,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  @override
  List<Object> get props => [];

  Locale get locale =>
      _locale;

  ThemeState copyWith({
    ThemeMode themeMode,
    double textScaleFactor,
    Locale locale,
    TargetPlatform platform,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this._locale,
      platform: platform ?? this.platform,
    );
  }

  @override
  String toString() {
    return 'ThemeState{themeMode: $themeMode, _textScaleFactor: $_textScaleFactor, _locale: $_locale, platform: $platform, isTestMode: $isTestMode}';
  }
}