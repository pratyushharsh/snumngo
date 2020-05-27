import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';

class WorkersDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: BlocProvider(
        create: (context) => WorkerBloc(
          RepositoryProvider.of(context)
        )..add(LoadWorker()),
        child: _WorkersDetail(),
      ),
    );
  }
}

class _WorkersDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerBloc, WorkerState>(
      builder: (builder, state) {
        if (state is LoadingWorker) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LoadedWorkerSuccess) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      minRadius: 40,
                      child: Text("PH"),
                    ),
                  ),
                  HeaderTag(tag: "Personal Detail",),
                  PersonalDetailSection(),
                  HeaderTag(tag: "Family Detail",),
                  FamilyDetailSection(),
                  HeaderTag(tag: "Current Address",),
                  AddressDetailSection(),
                  HeaderTag(tag: "Aadhaar Detail",),
                  AadhaarDetailSection(),
                  HeaderTag(tag: "Pan Card Detail",),
                  PanCardDetailSection(),
                  HeaderTag(tag: "Voter Id Detail",),
                  VoterIdDetailSection(),
                  HeaderTag(tag: "Occupation Detail",),
                  OccupationDetailSection()
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class PersonalDetailSection extends StatelessWidget {
  final PersonalInfo personalInfo;

  const PersonalDetailSection({Key key, this.personalInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Pratyush Harsh"),
          Row(
            children: <Widget>[
              Expanded(child: Row(
                children: <Widget>[
                  Icon(FontAwesome.mobile_phone),
                  Text("Mobile Number"),
                ],
              )),
              Expanded(child: Row(
                children: <Widget>[
                  Icon(FontAwesome.whatsapp),
                  Text("Whatsapp Number"),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class FamilyDetailSection extends StatelessWidget {

  final PersonalInfo personalInfo;

  const FamilyDetailSection({Key key, this.personalInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(tag: "Father's Name", desc: "thdjfyj tyjyt",),
          KeyDesc(tag: "Mother's Name", desc: "thdjfyj tyjyt",)
        ],
      ),
    );
  }
}

class AddressDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(tag: "House Number", desc: "345",),
          KeyDesc(tag: "Gali/Mohalla", desc: "Hosiyar Chowak",),
          KeyDesc(tag: "City", desc: "Styytjhlk",),
          KeyDesc(tag: "Ward no", desc: "19",),
          KeyDesc(tag: "State", desc: "Bihar",),
          Row(
            children: <Widget>[
              Expanded(child: KeyDesc(tag: "District", desc: "Samastipur",)),
              Expanded(child: KeyDesc(tag: "Pincode", desc: "854785",)),
            ],
          ),

        ],
      ),
    );
  }
}

class AadhaarDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
           KeyDesc(tag: "Aadhaar No", desc: "4567 2345 2343",),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                child: Placeholder(fallbackHeight: 100,),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Placeholder(
                  fallbackHeight: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PanCardDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(tag: "Pan Card No", desc: "ASYPH71111",),
          SizedBox(height: 10),
          Placeholder(fallbackHeight: 160,)
        ],
      ),
    );
  }
}

class VoterIdDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(tag: "Voter Id Number", desc: "IUGHBKJB",),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                child: Placeholder(fallbackHeight: 200,),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Placeholder(fallbackHeight: 200,),
              )
            ],
          )
        ],
      ),
    );
  }
}

class OccupationDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(tag: "Occupation Type", desc: "Street Vendor",)
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final Widget child;

  const DetailCard({Key key, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}

class KeyDesc extends StatelessWidget {
  final String tag;
  final String desc;

  const KeyDesc({Key key, this.tag, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: <Widget>[
          Text(
            tag + ": ",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Text(desc)
        ],
      ),
    );
  }
}

class HeaderTag extends StatelessWidget {
  final String tag;

  const HeaderTag({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 8,),
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(),
            ),
            SizedBox(width: 8,),
            Text(tag, style: Theme.of(context).textTheme.headline6,),
            SizedBox(width: 8,),
            Expanded(
              child: Divider(),
            )
          ],
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
