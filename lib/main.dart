import 'package:flutter/material.dart';
// import 'package:many_apps/Firebase/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'File Upload/FileHome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FileHome(),
    );
  }
}
