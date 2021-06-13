import 'package:flutter/material.dart';
import 'Json_App/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Json App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageJsonApp(),
    );
  }
}
