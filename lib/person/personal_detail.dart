import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/config/constants.dart';
import 'package:snumngo/generated/l10n.dart';

import 'model/person.dart';

class PersonalInfoWidget extends StatefulWidget {

  final Function onGenderChange;
  final Function onDateChange;

  const PersonalInfoWidget({Key key, this.onGenderChange, this.onDateChange}) : super(key: key);

  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
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
                flex: 4,
                child: RadioListTile(
                  onChanged: widget.onGenderChange,
                  selected: true,
                  value: "M",
                  groupValue: "M",
                  title: Text(S.of(context).male),
                ),
              ),
              Expanded(
                flex: 5,
                child: RadioListTile(
                  onChanged: widget.onGenderChange,
                  value: "F",
                  groupValue: "M",
                  title: Text(S.of(context).female),
                ),
              )
            ],
          ),
          _DOBWidget(
            dob: DateTime.now(),
            onDateChange: widget.onDateChange,
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

  final Function disableOnChange;
  final Function disableCertOnChange;
  final Function addDisablityCertificateImage;

  const DisabilityWidget({Key key, this.disableOnChange, this.disableCertOnChange, this.addDisablityCertificateImage}) : super(key: key);


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
                value: true,
                onChanged: disableOnChange,
              ),
            )
          ],
        ),
        Row(
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
      ],
    );
  }
}

class AadharBankWidget extends StatefulWidget {

  final Person person;

  const AadharBankWidget({Key key, this.person}) : super(key: key);

  @override
  _AadharBankWidgetState createState() => _AadharBankWidgetState();
}

class _AadharBankWidgetState extends State<AadharBankWidget> {

  AadharBankDetail aadhar;

  bool aadhaarLink = false;

  void onAadhaarChange(aadharNo) {
    setState(() {
      aadhar = aadhar.copyWith(aadhaarNo: aadharNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    aadhar = widget.person.aadhaarBank ?? AadharBankDetail();

    return Column(
      children: <Widget>[
        TextFormField(
          onChanged: this.onAadhaarChange,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: S.of(context).aadhar_no,
          ),
        ),
        Row(
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
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(S.of(context).aadhaar_link),
            ),
            Flexible(
              flex: 1,
              child: SwitchListTile(
                value: aadhaarLink,
                onChanged: (val) {
                  setState(() {
                    aadhaarLink = val;
                  });
                },
              ),
            )
          ],
        ),
        aadhaarLink ? Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: S.of(context).bank_name,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: S.of(context).bank_acc_no,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: S.of(context).ifcs,
                ),
              ),
            ],
          ),
        ) : Container()
      ],
    );
  }
}

class PanVoterWidget extends StatelessWidget {

  final Function onVoterIdChange;
  final String voterId;

  const PanVoterWidget({Key key, this.onVoterIdChange, this.voterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(hintText: S.of(context).pan_no),
        ),
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
            child: Text(
              S.of(context).dob,
              maxLines: 2,
            ),
          ),
          Expanded(
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
