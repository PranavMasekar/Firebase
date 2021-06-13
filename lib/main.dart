import 'package:flutter/material.dart';

import 'ChatApp/HomePageChat.dart';
//import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageChat(),
    );
  }
}
