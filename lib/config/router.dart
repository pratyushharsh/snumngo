import 'package:flutter/material.dart';
import 'package:snumngo/person/add_person.dart';
import 'package:snumngo/person/model/models.dart';
import 'package:snumngo/person/view_worker.dart';
import 'package:snumngo/screen/settings.dart';
import 'package:snumngo/screen/user_detail.dart';
import 'package:snumngo/workers/screen.dart';

class Router {
  
  static const String SETTINGS = '/settings';
  static const String USER_DETAIL = '/userDetail';
  static const String WORKERS = '/workers';
  static const String WORKERS_DETAIL = '/workersDetail';
  static const String ADD_NEW_WORKERS = '/addNewPerson';
  static const String UPDATE_WORKERS = '/updatePerson';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case USER_DETAIL:
        return MaterialPageRoute(builder: (_) => UserDetail());
      case WORKERS:
        return MaterialPageRoute(builder: (_) => WorkersScreen());
      case WORKERS_DETAIL:
        var person = settings.arguments as Worker;
        return MaterialPageRoute(builder: (_) => WorkersDetailScreen(person: person,));
      case ADD_NEW_WORKERS:
        return MaterialPageRoute(builder: (_) => AddPerson());
      case UPDATE_WORKERS:
        var args = settings.arguments as Map;
        return MaterialPageRoute(builder: (_) => AddPerson(person: args['person'], updateMode: args['updateMode'],));
      case SETTINGS:
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}'),),
        ));
    }
  }
}