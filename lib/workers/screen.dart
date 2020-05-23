import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addNewPerson');
        },
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[SearchBar()],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Card(
        margin: EdgeInsets.all(10),
        child: Container(
//        padding: EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for worker using id....",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(FontAwesome.filter),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey, width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey, width: 1.2),
              ),
            ),
          ),
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Wrap(
          spacing: 5.0,
          children: <Widget>[
            FilterChip(
              label: Text("Date"),
              selected: true,
              onSelected: (val) {

              },
            ),
            FilterChip(
              label: Text("EnployeeType"),
              selected: true,
              onSelected: (val) {

              },
            ),
          ],
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            ListTile(title: Text("tfygh"),),
            ListTile(title: Text("tfygh"),),
            ListTile(title: Text("tfygh"),),
            ListTile(title: Text("tfygh"),),
            ListTile(title: Text("tfygh"),),
          ],
        ),
      )
    ]);
  }
}
