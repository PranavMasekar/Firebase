import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:many_apps/Presentation/Screens/home.dart';
import '../../business logic/bloc/authenticationbloc_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AppStarted());
                    if (state is Authenticated)
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeFire()));
                    else
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Something went wrong")));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
