import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math';

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
          children: <Widget>[PeopleList(), SearchBar()],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
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
          children: <Widget>[],
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[],
        ),
      )
    ]);
  }
}

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 100),
        itemCount: 30,
        itemBuilder: (context, idx) {
          return ListTile(
            title: PeopleCard(),
          );
        });
  }
}

class PeopleCard extends StatelessWidget {
  var rdm = new Random();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('SNO# ${rdm.nextInt(2147483647)}'),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        children: <Widget>[
                          rdm.nextInt(2) == 0
                              ? Icon(
                                  FontAwesome.mars,
                                  color: Colors.blueAccent,
                                )
                              : Icon(
                                  FontAwesome.venus,
                                  color: Colors.pinkAccent,
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Pratyush Harsh'),
                          Text('')
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.whatsapp,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('+91${rdm.nextInt(1147483647) + 1000000000}')
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.mobile_phone,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('+91${rdm.nextInt(1147483647) + 1000000000}')
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(Icons.work),
            )
          ],
        ),
      ),
    );
  }
}
