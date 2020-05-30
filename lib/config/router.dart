import 'package:flutter/material.dart';
import 'package:snumngo/person/add_person.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/person/view_worker.dart';
import 'package:snumngo/screen/settings.dart';
import 'package:snumngo/screen/user_detail.dart';
import 'package:snumngo/workers/screen.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/userDetail':
        return MaterialPageRoute(builder: (_) => UserDetail());
      case '/workers':
        return MaterialPageRoute(builder: (_) => WorkersScreen());
      case '/workersDetail':
        var person = settings.arguments as Person;
        return MaterialPageRoute(builder: (_) => WorkersDetailScreen(person: person,));
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