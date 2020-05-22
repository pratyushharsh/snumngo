import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/config/constants.dart';
import 'package:snumngo/generated/l10n.dart';

class OccupationalDetail extends StatefulWidget {
  @override
  _OccupationalDetailState createState() => _OccupationalDetailState();
}

class _OccupationalDetailState extends State<OccupationalDetail> {
  String occupation;

  _buildOccupationDetail(context, occupation) {
    switch (occupation) {
      case "strt_vndr":
        return StreetVendorWidget();
      case "cns_wkr":
        return ConstructionWorkerWidget();
      case "wst_pkr":
        return WastePickerWidget();
      case "doms_wkr":
        return DomesticWorkerWidget();
      case "home_wkr":
        return HomeBasedWorkerWidget();
      case "rskw_pllr":
        return RickShawPullerWidget();
      case "agri_lbr":
        return AgricultureLabourWidget();
      case "others":
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
            onChanged: (val) {
              setState(() {
                occupation = val;
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            hint: Text(S.of(context).select_occupation),
            value: occupation,
            items: Constants.OCCUPATIONS.map((f) {
              return DropdownMenuItem(
                value: f,
                child: Text(Intl.message(f)),
              );
            }).toList(),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _buildOccupationDetail(context, occupation),
          )
        ],
      ),
    );
  }
}

class _Affiliated extends StatelessWidget {
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
                value: true,
              ),
            )
          ],
        ),
        Text(S.of(context).affiliated_with),
        TextFormField(
          decoration: InputDecoration(labelText: "Organization Name"),
        ),
      ],
    );
  }
}

class StreetVendorWidget extends StatelessWidget {
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
                    value: true,
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).strt_vndr_id_no),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).strt_vndr_muni_cert),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: S.of(context).strt_vndr_muni_cert_no),
            ),
            TextFormField(
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
                    value: true,
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
                    value: true,
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
                    value: true,
                  ),
                )
              ],
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class ConstructionWorkerWidget extends StatelessWidget {
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).cns_wkr_rgst_no),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).cns_wkr_lbr_card),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).cns_wkr_lbr_card_no),
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class WastePickerWidget extends StatelessWidget {
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).wst_pkr_rgst_no),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).wst_pkr_inst_id),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
                  ),
                )
              ],
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class DomesticWorkerWidget extends StatelessWidget {
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).dom_wkr_rwa_id),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).dom_wkr_police_verify),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).dom_wkr_police_verify_date),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).dom_wkr_inst_id),
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class HomeBasedWorkerWidget extends StatelessWidget {
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: S.of(context).home_wkr_artisans_card),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(S.of(context).home_wkr_artisans_cred_card),
                ),
                Flexible(
                  flex: 1,
                  child: Switch(
                    value: true,
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
                    value: true,
                  ),
                )
              ],
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class RickShawPullerWidget extends StatelessWidget {
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
                    value: true,
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
                    value: true,
                  ),
                )
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).rskw_pllr_lic_no),
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}

class AgricultureLabourWidget extends StatelessWidget {
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
                    value: true,
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
                    value: true,
                  ),
                )
              ],
            ),
            _Affiliated()
          ],
        ),
      ),
    );
  }
}
