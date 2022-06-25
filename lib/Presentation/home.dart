import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:many_apps/Business%20logic/bloc/authentication_bloc.dart';
import 'package:many_apps/Business%20logic/bloc/authentication_event.dart';
import 'package:many_apps/Business%20logic/bloc/authentication_state.dart';
import 'package:many_apps/Presentation/login.dart';

class HomeFire extends StatefulWidget {
  @override
  State<HomeFire> createState() => _HomeFireState();
}

class _HomeFireState extends State<HomeFire> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Firebase Authentication"),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(state.currentUser.photoURL!),
                    ),
                    Text(
                      state.currentUser.displayName!,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      state.currentUser.email!,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LogOut());
                      },
                      child: Text("Sign out"),
                    )
                  ],
                ),
              ),
            ),
          );
        } else
          return Login();
      },
    );
  }
}
