import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Business logic/bloc/authentication_bloc.dart';
import 'Business logic/bloc/authentication_event.dart';
import 'Data/Repository/user_repository.dart';
import 'Presentation/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: _userRepository)
        ..add(AppStarted()),
      child: MaterialApp(
          title: "Firebase",
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: Login()),
    );
  }
}
