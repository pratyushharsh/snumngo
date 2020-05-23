import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesome.sign_out),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Text("User Dashboard"),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.person),
                  minRadius: 30,
                ),
                SizedBox(height: 10,),
                Text("Pratyush Harsh", style: Theme.of(context).textTheme.button,)
              ],
            ),
          ),
          ListTile(
            title: Text("Persons"),
            onTap: () {
              Navigator.pushNamed(context, '/workers');
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
