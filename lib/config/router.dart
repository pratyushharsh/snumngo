import 'package:flutter/material.dart';
import 'package:snumngo/person/add_person.dart';
import 'package:snumngo/screen/settings.dart';
import 'package:snumngo/workers/screen.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/workers':
        return MaterialPageRoute(builder: (_) => WorkersScreen());
      case '/addNewPerson':
        return MaterialPageRoute(builder: (_) => AddPerson());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}'),),
        ));
    }
  }
}