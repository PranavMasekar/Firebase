import 'package:flutter/material.dart';

import 'Tik Tac Too Game/Homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cryptocurrency App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePageGame(),
    );
  }
}
