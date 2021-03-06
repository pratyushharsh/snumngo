import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:snumngo/person/model/person.dart';
import 'package:snumngo/workers/search/bloc.dart';

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
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        List<Person> wks = state.person;

        if (wks.length == 0) {
          return Card(
            child: Center (
              child: Text('Nothing To display'),
            ),
          );
        }

        return ListView.builder(
            padding: EdgeInsets.only(top: 100),
            itemCount: wks.length,
            itemBuilder: (context, idx) {
              Person p = wks[idx];
              return ListTile(
                title: PeopleCard(
                  sno: p.personalInfo.sno,
                  fullname: p.personalInfo.name,
                  gender: p.personalInfo.gender,
                  phone: p.personalInfo.mobile,
                ),
              );
            });
      },
    );
  }
}

class PeopleCard extends StatelessWidget {

  final String sno;
  final String fullname;
  final String gender;
  final String phone;

  const PeopleCard({Key key, this.sno, this.fullname, this.gender, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/workersDetail', arguments: sno);
        },
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
                      Text('SNO# $sno'),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          children: <Widget>[
                            gender.compareTo('M') == 0
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
                            Text(fullname),
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
                                Text(
                                    '+91$phone')
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
                                Text(
                                    '+91$phone')
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
      ),
    );
  }
}
