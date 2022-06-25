import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../Business logic/bloc/authentication_bloc.dart';
import '../Business logic/bloc/authentication_event.dart';
import '../Business logic/bloc/authentication_state.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> addSingInEvent(context) async {
    BlocProvider.of<AuthenticationBloc>(context).add(LogIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (_, state) {
        if (state is Authenticated)
          return HomeFire();
        else if (state is Unauthenticated)
          return Scaffold(
            backgroundColor: Colors.grey,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      await addSingInEvent(context);
                    },
                  )
                ],
              ),
            ),
          );
        else
          return Text("sdf");
      },
    );
  }
}
