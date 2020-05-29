import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:snumngo/bloc/authentication/bloc.dart';
import 'package:snumngo/bloc/theme/bloc.dart';
import 'package:snumngo/config/router.dart';
import 'package:snumngo/dashboard/screen.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/repository/cloud_storage.dart';
import 'package:snumngo/repository/user_repository.dart';
import 'package:snumngo/repository/workers_repo.dart';
import 'package:snumngo/simple_bloc_delegate.dart';
import 'package:snumngo/workers/search/search_bloc.dart';

import 'login/login_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<WorkersRepository>(
          create: (context) => WorkersRepository(),
        ),
        RepositoryProvider<CloudStorageRepository>(
          create: (context) => CloudStorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
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
            AuthenticationBloc(repository: RepositoryProvider.of(context))..add(AppStarted()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
                RepositoryProvider.of(context)
            ),
          )
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: state.locale,
        localeResolutionCallback: (locale, supportedLocales) {
          return locale;
        },
        onGenerateRoute: Router.generateRoute,
        home: MainScreen(),
      );
    });
  }
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is UnAuthenticated) {
          return LoginScreen();
        } else if (state is Authenticated) {
          return DashBoard(currentUser: state.email, userDisplayName: state.displayName,);
        } else {
          return Container();
        }
      },
    );
  }
}
