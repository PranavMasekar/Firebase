import 'package:flutter/material.dart';
import 'package:many_apps/services/auth.dart';

class HomeFire extends StatelessWidget {
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
            ],
          ),
        )));
  }
}
