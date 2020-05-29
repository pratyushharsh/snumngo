import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snumngo/bloc/authentication/authentication_bloc.dart';
import 'package:snumngo/bloc/authentication/authentication_event.dart';
import 'package:snumngo/bloc/authentication/authentication_state.dart';

class UserDetail extends StatelessWidget {

  GlobalKey<FormState> _userForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: Text('User Detail'),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: Form(
                  key: _userForm,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          minRadius: 80,
                          child: Text("PH", style: TextStyle(
                              fontSize: 50
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        autovalidate: true,
                        onFieldSubmitted: (val) {
                          BlocProvider.of<AuthenticationBloc>(context).add(UpdateUserDisplayName(val));
                        },
                        initialValue: state.displayName,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person,),
                            hintText: 'Profile Name'
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        enabled: false,
                        initialValue: state.email,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email)
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container(
          child: Center(child: Text('Not Authenticated, Please Login')),
        );
      }
    );
  }
}
