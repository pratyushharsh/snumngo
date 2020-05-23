import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/bloc/theme/bloc.dart';
import 'package:snumngo/generated/l10n.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Select Your Language"),
                  ),
                  Expanded(
                    child: BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return DropdownButton(
                          isExpanded: true,
                          hint: Text('Select Language'),
                          value: state.locale,
                          onChanged: (val) {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ChangeLocale(locale: val));
                          },
                          items: S.delegate.supportedLocales.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.toString()),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
