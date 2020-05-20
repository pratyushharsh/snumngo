import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/generated/l10n.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        print("changed");
      },
      child: TabBarView(
        children: <Widget>[_PersonalDetail(), Container()],
      ),
    );
  }
}

class _PersonalDetail extends StatefulWidget {
  @override
  __PersonalDetailState createState() => __PersonalDetailState();
}

class __PersonalDetailState extends State<_PersonalDetail> {
  DateTime _dob = new DateTime.now();
  bool _disable = false;

  String _aadharNo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  S.of(context).dob,
                  maxLines: 2,
                ),
              ),
              Expanded(
                flex: 1,
                child: OutlineButton(
                  child: Text(DateFormat("dd-MMM-yyyy").format(_dob)),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: _dob,
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null)
                      setState(() {
                        _dob = value;
                      });
                    });
                  },
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(S.of(context).disability),
              ),
              Flexible(
                flex: 1,
                child: SwitchListTile(
                  value: _disable,
                  onChanged: (val) {
                    setState(() {
                      _disable = val;
                    });
                  },
                ),
              )
            ],
          ),
          _disable ? Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: S.of(context).disable_certi_no
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Colors.black12,
                    child: IconButton(
                      iconSize: 50,
                      color: Colors.black12,
                      icon: Icon(Icons.add),
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              )
            ],
          ) : Container(),
          TextFormField(
            onChanged: (val) {
              setState(() {
                _aadharNo = val;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: S.of(context).aadhar_no,
            ),
          ),
          _aadharNo != null && _aadharNo.isNotEmpty ? Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Placeholder(
                        fallbackHeight: 80,
                      ),
                      Text(S.of(context).front_aadhar)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Placeholder(
                        fallbackHeight: 80,
                      ),
                      Text(S.of(context).back_aadhar)
                    ],
                  ),
                ),
              ),
            ],
          ) : Container(),
        ],
      ),
    );
  }
}
