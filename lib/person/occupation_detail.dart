import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';

class OccupationalDetail extends StatefulWidget {
  @override
  _OccupationalDetailState createState() => _OccupationalDetailState();
}

class _OccupationalDetailState extends State<OccupationalDetail> {
  OccupationTypes occupationType;
  Occupation occp;


  @override
  void initState() {
    occp = BlocProvider.of<PersonBloc>(context).person.occupation;
    occupationType = occp?.type();
  }

  _buildOccupationDetail(BuildContext context, OccupationTypes occupationTypes) {
    switch (occupationTypes) {
      case OccupationTypes.STREET_VENDOR:
        return StreetVendorWidget(occupation: occp,);
      case OccupationTypes.CONSTRUCTION_WORKER:
        return ConstructionWorkerWidget(occupation: occp,);
      case OccupationTypes.WASTE_PICKER:
        return WastePickerWidget();
      case OccupationTypes.DOMESTIC_WORKER:
        return DomesticWorkerWidget();
      case OccupationTypes.HOME_BASED_WORKER:
        return HomeBasedWorkerWidget();
      case OccupationTypes.RICKSHAW_PULLER:
        return RickShawPullerWidget();
      case OccupationTypes.AGRICULTURE_LABOUR:
        return AgricultureLabourWidget();
      case OccupationTypes.OTHERS:
      default:
        return Card(
          margin: EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Add Your Occupation Or Choose from the Dropdown"),
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(S.of(context).occupation),
          DropdownButtonFormField(
            validator: (val) {
              if (val == null) return 'Choose An Occupation';
              return null;
            },
            onChanged: (val) {
              setState(() {
                occupationType = val;
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            hint: Text(S.of(context).select_occupation),
            value: occupationType,
            items: OccupationTypes.values.map((f) {
              return DropdownMenuItem(
                value: f,
                child: Text(Intl.message(f.toString())),
              );
            }).toList(),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildOccupationDetail(context, occupationType),
          )
        ],
      ),
    );
  }
}

class _Affiliated extends StatelessWidget {
  final bool aafilOtherOrg;
  final Function onAffilatedChange;
  final Function onOrgNameChange;

  const _Affiliated(
      {Key key,
      @required this.aafilOtherOrg,
      @required this.onAffilatedChange,
      @required this.onOrgNameChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(S.of(context).r_u_affiliated_org),
            ),
            Flexible(
              flex: 1,
              child: Switch(
                value: aafilOtherOrg,
                onChanged: onAffilatedChange,
              ),
            )
          ],
        ),
        aafilOtherOrg ? Text(S.of(context).affiliated_with) : Container(),
        aafilOtherOrg ? TextFormField(
          onChanged: onOrgNameChange,
          decoration: InputDecoration(labelText: "Organization Name"),
        ) : Container(),
      ],
    );
  }
}

class StreetVendorWidget extends StatefulWidget {

  final Occupation occupation;

  const StreetVendorWidget({Key key, this.occupation}) : super(key: key);

  @override
  _StreetVendorWidgetState createState() => _StreetVendorWidgetState();
}

class _StreetVendorWidgetState extends State<StreetVendorWidget> {

  bool municipalId = false;
  bool municipalCertificate = false;
  bool affilOtherOrg = false;
  StreetVendor sv;

  @override
  void initState() {
    sv = widget.occupation ?? StreetVendor();
  }

  onIdChange(val) {
    setState(() {
      sv = sv.copyWith(municipalId: val);
    });
  }

  onMunicipalCertificateChange(val) {
    setState(() {
      sv = sv.copyWith(certificateNo: val);
    });
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(sv));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).surveyed_strt_vndr),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: sv.surveyed,
                    onChanged: (val) {
                      setState(() {
                        sv = sv.copyWith(surveyed: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_id),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: municipalId,
                    onChanged: (val) {
                      setState(() {
                        municipalId = val;
                      });
                    },
                  ),
                )
              ],
            ),
            municipalId ? TextFormField(
              initialValue: sv.certificateNo,
              onChanged: onIdChange,
              decoration:
                  InputDecoration(labelText: S.of(context).strt_vndr_id_no),
            ) : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_muni_cert),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: municipalCertificate,
                    onChanged: (val) {
                      setState(() {
                        municipalCertificate = val;
                      });
                    },
                  ),
                )
              ],
            ),
            municipalCertificate ? TextFormField(
              onChanged: onMunicipalCertificateChange,
              decoration: InputDecoration(
                  labelText: S.of(context).strt_vndr_muni_cert_no),
            ) : Container(),
            TextFormField(
              initialValue: sv.placeOfEmp,
              onChanged: (val) {
                setState(() {
                  sv = sv.copyWith(placeEmployee: val);
                });
              },
              decoration:
                  InputDecoration(labelText: S.of(context).strt_vndr_plc_emp),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_food),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: sv.foodVendor,
                    onChanged: (val) {
                      setState(() {
                        sv = sv.copyWith(foodVendor: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_fssai),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: sv.fssaiTranie,
                    onChanged: (val) {
                      setState(() {
                        sv = sv.copyWith(fssaiTraining: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_fssai_trni),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: sv.fssaiCertificate,
                    onChanged: (val) {
                      setState(() {
                        sv = sv.copyWith(fssaiTrainingCertificate: val);
                      });
                    },
                  ),
                )
              ],
            ),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                   sv = sv.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ConstructionWorkerWidget extends StatefulWidget {

  final Occupation occupation;

  const ConstructionWorkerWidget({Key key, this.occupation}) : super(key: key);

  @override
  _ConstructionWorkerWidgetState createState() =>
      _ConstructionWorkerWidgetState();
}

class _ConstructionWorkerWidgetState extends State<ConstructionWorkerWidget> {
  bool registeredWelfare = false;
  bool haveLabourCard = false;
  bool affilOtherOrg = false;

  ConstructionWorker consWkr;

  @override
  void initState() {
    consWkr = widget.occupation ?? ConstructionWorker();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(consWkr));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).cns_wkr_rgst),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: registeredWelfare,
                    onChanged: (val) {
                      setState(() {
                        registeredWelfare = val;
                      });
                    },
                  ),
                )
              ],
            ),
            registeredWelfare
                ? TextFormField(
                    decoration: InputDecoration(
                        labelText: S.of(context).cns_wkr_rgst_no),
                    onChanged: (val) {
                      setState(() {
                        consWkr = consWkr.copyWith(registeredNo: val);
                      });
                    },
                  )
                : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).cns_wkr_lbr_card),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: haveLabourCard,
                    onChanged: (val) {
                      setState(() {
                        haveLabourCard = val;
                      });
                    },
                  ),
                )
              ],
            ),
            haveLabourCard
                ? TextFormField(
                    decoration: InputDecoration(
                        labelText: S.of(context).cns_wkr_lbr_card_no),
              onChanged: (val) {
                setState(() {
                  consWkr = consWkr.copyWith(laborNumber: val);
                });
              },
                  )
                : Container(),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  consWkr = consWkr.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class WastePickerWidget extends StatefulWidget {

  final Occupation occupation;

  const WastePickerWidget({Key key, this.occupation}) : super(key: key);

  @override
  _WastePickerWidgetState createState() => _WastePickerWidgetState();
}

class _WastePickerWidgetState extends State<WastePickerWidget> {
  bool affilOtherOrg = false;
  bool municipalRegistered = false;

  WastePicker wp;

  @override
  void initState() {
    wp = widget.occupation ?? WastePicker();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(wp));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).wst_pkr_rgst),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: municipalRegistered,
                    onChanged: (val) {
                      setState(() {
                        municipalRegistered = val;
                      });
                    },
                  ),
                )
              ],
            ),
            municipalRegistered ? TextFormField(
              onChanged: (val) {
                setState(() {
                  wp = wp.copyWith(registrationNumber: val);
                });
              },
              decoration:
                  InputDecoration(labelText: S.of(context).wst_pkr_rgst_no),
            ) : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).wst_pkr_inst_id),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: wp.idCardIssue,
                    onChanged: (val) {
                      setState(() {
                        wp = wp.copyWith(idIssueByInst: val);
                      });
                    },
                  ),
                )
              ],
            ),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  wp = wp.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class DomesticWorkerWidget extends StatefulWidget {

  final Occupation occupation;

  const DomesticWorkerWidget({Key key, this.occupation}) : super(key: key);

  @override
  _DomesticWorkerWidgetState createState() => _DomesticWorkerWidgetState();
}

class _DomesticWorkerWidgetState extends State<DomesticWorkerWidget> {
  bool affilOtherOrg = false;
  bool policeVerify = false;
  bool rwaRgst = false;

  DomesticWorker dw = DomesticWorker();

  @override
  void initState() {
    dw = widget.occupation ?? DomesticWorker();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(dw));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).dom_wkr_rwa),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: rwaRgst,
                    onChanged: (val) {
                      setState(() {
                        rwaRgst = val;
                      });
                    },
                  ),
                )
              ],
            ),
            rwaRgst ? TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).dom_wkr_rwa_id),
            ) : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).dom_wkr_police_verify),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: policeVerify,
                    onChanged: (val) {
                      setState(() {
                        policeVerify = val;
                        print(val);
                        print(dw.verifyTime);

                        dw = dw.copyWith(verifyTime: null);
                      });
                    },
                  ),
                )
              ],
            ),
            policeVerify ? PoliceVerifyWidget(verifyTime: dw.verifyTime, onDateChange: (val) {
              setState(() {
                dw = dw.copyWith(verifyTime: val);
              });
            },) : Container(),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  dw = dw.copyWith(instituteId: val);
                });
              },
              decoration:
                  InputDecoration(labelText: S.of(context).dom_wkr_inst_id),
            ),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  dw = dw.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class HomeBasedWorkerWidget extends StatefulWidget {

  final Occupation occupation;

  const HomeBasedWorkerWidget({Key key, this.occupation}) : super(key: key);

  @override
  _HomeBasedWorkerWidgetState createState() => _HomeBasedWorkerWidgetState();
}

class _HomeBasedWorkerWidgetState extends State<HomeBasedWorkerWidget> {
  bool affilOtherOrg = false;
  bool artisianCard = false;

  HomeBasedWorker hw = HomeBasedWorker();

  @override
  void initState() {
    hw = widget.occupation ?? HomeBasedWorker();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(hw));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).home_wkr_artisans),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: artisianCard,
                    onChanged: (val) {
                      setState(() {
                        artisianCard = val;
                      });
                    },
                  ),
                )
              ],
            ),
            artisianCard ? TextFormField(
              onChanged: (val) {
                setState(() {
                  hw = hw.copyWith(artisanNo: val);
                });
              },
              decoration: InputDecoration(
                  labelText: S.of(context).home_wkr_artisans_card),
            ) : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).home_wkr_artisans_cred_card),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: hw.artisansCreditCard,
                    onChanged: (val) {
                      setState(() {
                        hw = hw.copyWith(artisanCreditCard: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).home_wkr_indus_aadhaar),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: hw.industryCard,
                    onChanged: (val) {
                      setState(() {
                        hw = hw.copyWith(artisanAadharCard: val);
                      });
                    },
                  ),
                )
              ],
            ),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  hw = hw.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class RickShawPullerWidget extends StatefulWidget {

  final Occupation occupation;

  const RickShawPullerWidget({Key key, this.occupation}) : super(key: key);

  @override
  _RickShawPullerWidgetState createState() => _RickShawPullerWidgetState();
}

class _RickShawPullerWidgetState extends State<RickShawPullerWidget> {

  RickshawPuller rp;
  bool rskwLsc = false;
  bool affilOtherOrg = false;

  @override
  void initState() {
    rp = widget.occupation ?? RickshawPuller();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(rp));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).rskw_pllr_surveyed),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: rp.surveyed,
                    onChanged: (val) {
                      setState(() {
                        rp = rp.copyWith(surveyedLabour: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).rskw_pllr_lic),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: rskwLsc,
                    onChanged: (val) {
                      setState(() {
                        rskwLsc = val;
                      });
                    },
                  ),
                )
              ],
            ),
            rskwLsc? TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).rskw_pllr_lic_no),
            ) : Container(),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  rp = rp.copyWith(otherOrganization: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class AgricultureLabourWidget extends StatefulWidget {

  final Occupation occupation;

  const AgricultureLabourWidget({Key key, this.occupation}) : super(key: key);

  @override
  _AgricultureLabourWidgetState createState() => _AgricultureLabourWidgetState();
}

class _AgricultureLabourWidgetState extends State<AgricultureLabourWidget> {
  bool affilOtherOrg = false;

  AgricultureLabour al = AgricultureLabour();

  @override
  void initState() {
    al = widget.occupation ?? AgricultureLabour();
  }

  @override
  void setState(fn) {
    BlocProvider.of<PersonBloc>(context).add(UpdateOccupation(al));
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).agri_lbr_aware_min_wage),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: al.minWageAware,
                    onChanged: (val) {
                      setState(() {
                        al = al.copyWith(minWageAware: val);
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).agri_lbr_min_wage),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: al.minWage,
                    onChanged: (val) {
                      setState(() {
                        al = al.copyWith(minWage: val);
                      });
                    },
                  ),
                )
              ],
            ),
            _Affiliated(
              aafilOtherOrg: affilOtherOrg,
              onAffilatedChange: (val) {
                setState(() {
                  affilOtherOrg = val;
                });
              },
              onOrgNameChange: (val) {
                setState(() {
                  al = al.copyWith(otherOrg: val);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class PoliceVerifyWidget extends StatelessWidget {

  final DateTime verifyTime;
  final Function onDateChange;

  const PoliceVerifyWidget({Key key, this.verifyTime, this.onDateChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(S.of(context).dom_wkr_police_verify_date),
        ),
        Expanded(
          child: OutlineButton(
            child: Text(DateFormat("dd-MMM-yyyy").format(verifyTime ?? DateTime.now())),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: verifyTime ?? DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null)
                  onDateChange(value);
              });
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        )
      ],
    );
  }
}
