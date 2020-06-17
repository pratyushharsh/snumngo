import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snumngo/bloc/authentication/authentication_bloc.dart';
import 'package:snumngo/bloc/authentication/bloc.dart';
import 'package:snumngo/config/router.dart';

class DashBoard extends StatelessWidget {

  final String currentUser;
  final String userDisplayName;

  const DashBoard({Key key, this.currentUser, this.userDisplayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesome.sign_out),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      drawer: AppDrawer(userEmail: currentUser, userDisplayName: userDisplayName,),
      body: Container(
        child: Text("User Dashboard"),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {

  final String userEmail;
  final String userDisplayName;

  const AppDrawer({Key key, this.userEmail, this.userDisplayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/userDetail');
            },
            child: DrawerHeader(
              curve: Curves.bounceIn,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.person),
                    minRadius: 30,
                  ),
                  SizedBox(height: 10,),
                  Text(userDisplayName??"", style: Theme.of(context).textTheme.button,),
                  Text(userEmail??"", style: Theme.of(context).textTheme.caption,)
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Persons"),
            onTap: () {
              Navigator.pushNamed(context, Router.WORKERS);
            },
          ),
          SizedBox(height: 60,),
          Divider(),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }
}
