import 'package:flutter/material.dart';

import 'Firebase/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cryptocurrency App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeFire(),
    );
  }
}
