import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/config/constants.dart';
import 'package:snumngo/generated/l10n.dart';

class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  DateTime _dob = new DateTime.now();

  bool _disable = false;
  String _disableCertNo;

  String _aadharNo;
  String _voterCard;
  String _gender = "F";

  String house;
  String street;
  String city;
  String ward;
  String municipal;
  String district;
  String pincode;
  String state;

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
          PersonalInfoWidget(),
          AddressWidget(
            stateOnChange: (val) {
              setState(() {
                state = val;
              });
            },
            state: state,
          ),
          DisabilityWidget(
            disable: _disable,
            disableOnChange: (val) {
              setState(() {
                _disable = val;
              });
            },
            disableCertOnChange: (cert) {
              setState(() {
                _disableCertNo = cert;
              });
            },
          ),
          AadharWidget(
            aadharNo: _aadharNo,
            onAadhaarChange: (val) {
              setState(() {
                _aadharNo = val;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: S.of(context).pan_no),
          ),
          VoterWidget(
            voterId: _voterCard,
            onVoterIdChange: (val) {
              setState(() {
                _voterCard = val;
              });
            },
          )
        ],
      ),
    );
  }
}

class PersonalInfoWidget extends StatelessWidget {

  final Function onGenderChange;
  final Function onDateChange;

  const PersonalInfoWidget({Key key, this.onGenderChange, this.onDateChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).sno),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).name, icon: Icon(Icons.person)),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: S.of(context).mobile_num, icon : Icon(Icons.phone)),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration:
            InputDecoration(labelText: S.of(context).whatsapp_number, icon : Icon(FontAwesome.whatsapp)),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(S.of(context).gender),
              ),
              Expanded(
                flex: 3,
                child: RadioListTile(
                  onChanged: onGenderChange,
                  selected: true,
                  value: "M",
                  groupValue: "M",
                  title: Text(S.of(context).male),
                ),
              ),
              Expanded(
                flex: 3,
                child: RadioListTile(
                  onChanged: onGenderChange,
                  value: "F",
                  groupValue: "M",
                  title: Text(S.of(context).female),
                ),
              )
            ],
          ),
          _DOBWidget(
            dob: DateTime.now(),
            onDateChange: onDateChange,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).fathers_name),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).mothers_name),
          ),
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  final Function houseOnChange;
  final Function streetOnChange;
  final Function cityOnChange;
  final Function wardOnChange;
  final Function municipalOnChange;
  final Function districtOnChange;
  final Function pincodeOnChange;
  final Function stateOnChange;

  final String state;

  AddressWidget(
      {Key key,
        this.houseOnChange,
        this.streetOnChange,
        this.cityOnChange,
        this.wardOnChange,
        this.municipalOnChange,
        this.districtOnChange,
        this.pincodeOnChange,
        this.stateOnChange, this.state})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Address Details"),
        TextFormField(
          decoration: InputDecoration(labelText: S.of(context).house),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: S.of(context).street),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: S.of(context).city),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: S.of(context).ward),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: S.of(context).muncipal),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: S.of(context).district),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: S.of(context).pincode),
              ),
            ),
          ],
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0, top: 12),
            labelText: S.of(context).state
          ),
          onChanged: stateOnChange,
          value: state,
          items: Constants.STATES.map<DropdownMenuItem<String>>((v) {
            return DropdownMenuItem<String>(
              value: v,
              child: Text(Intl.message(v)),
            );
          }).toList(),
        )
      ],
    );
  }
}

class DisabilityWidget extends StatelessWidget {

  final bool disable;
  final Function disableOnChange;
  final Function disableCertOnChange;
  final Function addDisablityCertificateImage;

  const DisabilityWidget({Key key, this.disable, this.disableOnChange, this.disableCertOnChange, this.addDisablityCertificateImage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(S.of(context).disability),
            ),
            Flexible(
              flex: 1,
              child: SwitchListTile(
                value: disable,
                onChanged: disableOnChange,
              ),
            )
          ],
        ),
        disable
            ? Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextFormField(
                onChanged: disableCertOnChange,
                decoration: InputDecoration(
                    labelText: S.of(context).disable_certi_no),
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
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        )
            : Container(),
      ],
    );
  }
}

class AadharWidget extends StatelessWidget {

  final Function onAadhaarChange;
  final String aadharNo;

  const AadharWidget({Key key, this.onAadhaarChange, this.aadharNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          onChanged: onAadhaarChange,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: S.of(context).aadhar_no,
          ),
        ),
        aadharNo != null && aadharNo.isNotEmpty
            ? Row(
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
        )
            : Container(),
      ],
    );
  }
}

class VoterWidget extends StatelessWidget {

  final Function onVoterIdChange;
  final String voterId;

  const VoterWidget({Key key, this.onVoterIdChange, this.voterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          onChanged: onVoterIdChange,
          decoration: InputDecoration(hintText: S.of(context).voter_card),
        ),
        voterId != null && voterId.isNotEmpty
            ? Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Placeholder(
                      fallbackHeight: 80,
                    ),
                    Text(S.of(context).front_voter)
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
                    Text(S.of(context).back_voter)
                  ],
                ),
              ),
            ),
          ],
        )
            : Container(),
      ],
    );
  }
}

class _DOBWidget extends StatelessWidget {

  final Function onDateChange;
  final DateTime dob;

  const _DOBWidget({Key key, this.onDateChange, this.dob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
              child: Text(DateFormat("dd-MMM-yyyy").format(dob)),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: dob,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null)
                    onDateChange(value);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
