import 'package:flutter/material.dart';
import 'package:many_apps/services/auth.dart';

import 'login.dart';

class HomeFire extends StatelessWidget {
  signoutmethod(context) async {
    await signout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(imgurl),
              ),
              Text(name),
              Text(email),
              ElevatedButton(
                  onPressed: () {
                    signoutmethod(context);
                  },
                  child: Text("Sign out"))
            ],
          ),
        )));
  }
}
