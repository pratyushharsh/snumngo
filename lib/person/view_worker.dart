import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';

class WorkersDetailScreen extends StatelessWidget {
  final String sno;

  const WorkersDetailScreen({Key key, this.sno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: BlocProvider(
        create: (context) =>
            WorkerBloc(RepositoryProvider.of(context))..add(LoadWorker(sno)),
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
                  HeaderTag(
                    tag: "Personal Detail",
                  ),
                  PersonalDetailSection(
                    personalInfo: state.worker.personalInfo,
                  ),
                  HeaderTag(
                    tag: "Family Detail",
                  ),
                  FamilyDetailSection(
                    personalInfo: state.worker.personalInfo,
                  ),
                  HeaderTag(
                    tag: "Current Address",
                  ),
                  AddressDetailSection(
                    address: state.worker.address,
                  ),
                  HeaderTag(
                    tag: "Aadhaar Detail",
                  ),
                  AadhaarDetailSection(
                    aadhaar: state.worker.aadhaarBank,
                  ),
                  HeaderTag(
                    tag: "Pan Card Detail",
                  ),
                  PanCardDetailSection(
                    panDetail: state.worker.panVoterDetail,
                  ),
                  HeaderTag(
                    tag: "Voter Id Detail",
                  ),
                  VoterIdDetailSection(
                    voterDetail: state.worker.panVoterDetail,
                  ),
                  HeaderTag(
                    tag: "Occupation Detail",
                  ),
                  OccupationDetailSection(
                    occupation: state.worker.occupation,
                  )
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
          KeyDesc(
            tag: "Full Name",
            desc: personalInfo?.name ?? "",
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Icon(FontAwesome.mobile_phone),
                  Text(personalInfo?.mobile ?? ""),
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Icon(FontAwesome.whatsapp),
                  Text(personalInfo?.whatsapp ?? ""),
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
          KeyDesc(
            tag: "Father's Name",
            desc: personalInfo?.fatherName ?? "",
          ),
          KeyDesc(
            tag: "Mother's Name",
            desc: personalInfo?.motherName ?? "",
          )
        ],
      ),
    );
  }
}

class AddressDetailSection extends StatelessWidget {
  final Address address;

  const AddressDetailSection({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(
            tag: "House Number",
            desc: address?.houseNo ?? "",
          ),
          KeyDesc(
            tag: "Gali/Mohalla",
            desc: address?.street ?? "",
          ),
          KeyDesc(
            tag: "City",
            desc: address?.city ?? "",
          ),
          KeyDesc(
            tag: "Ward no",
            desc: address?.ward ?? "",
          ),
          KeyDesc(
            tag: "State",
            desc: address?.state ?? "",
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: KeyDesc(
                tag: "District",
                desc: address?.district ?? "",
              )),
              Expanded(
                  child: KeyDesc(
                tag: "Pincode",
                desc: address?.pincode ?? "",
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class AadhaarDetailSection extends StatelessWidget {
  final AadharBankDetail aadhaar;

  const AadhaarDetailSection({Key key, this.aadhaar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(aadhaar);
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(
            tag: "Aadhaar No",
            desc: aadhaar?.aadhaarNo ?? "",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: aadhaar.frontUrl != null && aadhaar.frontUrl.isNotEmpty
                    ? Image.network(aadhaar.frontUrl)
                    : NoImageAvailable(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: aadhaar.backUrl != null && aadhaar.backUrl.isNotEmpty
                    ? Image.network(aadhaar.backUrl)
                    : NoImageAvailable(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PanCardDetailSection extends StatelessWidget {
  final PanVoterDetail panDetail;

  const PanCardDetailSection({Key key, this.panDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(
            tag: "Pan Card No",
            desc: panDetail?.pancard ?? "",
          ),
          SizedBox(height: 10),
          panDetail.panUrl != null && panDetail.panUrl.isNotEmpty
              ? Image.file(File(panDetail.panUrl))
              : NoImageAvailable(height: 130,),
        ],
      ),
    );
  }
}

class VoterIdDetailSection extends StatelessWidget {
  final PanVoterDetail voterDetail;

  const VoterIdDetailSection({Key key, this.voterDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(
            tag: "Voter Id Number",
            desc: voterDetail?.voterCard ?? "",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: voterDetail.voterUrlFront != null &&
                          voterDetail.voterUrlFront.isNotEmpty
                      ? Image.file(File(voterDetail.voterUrlFront))
                      : NoImageAvailable()),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: voterDetail.voterUrlBack != null &&
                          voterDetail.voterUrlBack.isNotEmpty
                      ? Image.file(File(voterDetail.voterUrlBack))
                      : NoImageAvailable()),
            ],
          )
        ],
      ),
    );
  }
}

class OccupationDetailSection extends StatelessWidget {
  final Occupation occupation;

  const OccupationDetailSection({Key key, this.occupation}) : super(key: key);

  List<Widget> _generateMap() {
    List<KeyDesc> out = [];
    occupation.getMap().forEach((key, value) {
      KeyDesc k = KeyDesc(tag: Intl.message(key), desc: value.toString(),);
      out.add(k);
    });
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return DetailCard(
      child: Column(
        children: <Widget>[
          KeyDesc(
            tag: "Occupation Type",
            desc: occupation.type()??"",
          ),
          ..._generateMap()
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
            style: TextStyle(fontWeight: FontWeight.bold),
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
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              tag,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Divider(),
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class NoImageAvailable extends StatelessWidget {

  final double height;

  const NoImageAvailable({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Image.asset('assets/no-image.png', height: height,),
    );
  }
}
