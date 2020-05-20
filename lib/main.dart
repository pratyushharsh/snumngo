import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:snumngo/bloc/authentication/bloc.dart';
import 'package:snumngo/bloc/theme/bloc.dart';
import 'package:snumngo/repository/user_repository.dart';
import 'package:snumngo/simple_bloc_delegate.dart';

import 'login/login_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc()
            ..add(InitialTheme(
                isTestMode: false,
                locale: null,
                themeMode: ThemeMode.system,
                platform: defaultTargetPlatform)),
        ),
        BlocProvider(
          create: (context) =>
          AuthenticationBloc(repository: userRepository)..add(AppStarted()),
        )
      ],
      child: MyApp(userRepository: userRepository,),
    ),
  );
}

class MyApp extends StatelessWidget {

  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: state.locale,
        localeResolutionCallback: (locale, supportedLocales) {
          return locale;
        },
        home: _MainScreen(userRepository: _userRepository,),
      );
    });
  }
}

class _MainScreen extends StatelessWidget {

  final UserRepository userRepository;

  const _MainScreen({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is UnAuthenticated) {
          return LoginScreen(userRepository: userRepository);
        } else if (state is Authenticated) {
          return Container(
            child: Text("Authenticated"),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
