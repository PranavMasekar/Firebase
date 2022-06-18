import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:many_apps/Presentation/Screens/home.dart';

import 'Data/Repository/user_repository.dart';
import 'Presentation/Screens/login.dart';
import 'business logic/bloc/authenticationbloc_bloc.dart';

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
      create: (context) =>
          AuthenticationBloc(userRepository: _userRepository)..add(LoggedIn()),
      child: MaterialApp(
        title: "Firebase",
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated)
              return HomeFire();
            else
              return Login();
          },
        ),
      ),
    );
  }
}
