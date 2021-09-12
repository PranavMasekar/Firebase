import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:many_apps/services/auth.dart';
// import 'constant.dart';
import 'home.dart';
//import 'localdb.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> checkuserlog() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser;
    if (user != null) {
      name = user.displayName.toString();
      email = user.email.toString();
      imgurl = user.photoURL.toString();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeFire()));
    }
  }

  void initState() {
    checkuserlog();
  }

  signInMethod() async {
    await signin();
    // constant.name = (await LocalData.getname())!;
    // constant.email = (await LocalData.getemail())!;
    // constant.img = (await LocalData.getimg())!;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeFire()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login To App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed: () {
              signInMethod();
            })
          ],
        ),
      ),
    );
  }
}
