import 'package:flutter/material.dart';

enum LoginScreen { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  LoginScreen currentstate = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;

  showMobilePhoneWidget(context) {
    return Column();
  }

  showOtpFromWidget(context) {
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentstate == LoginScreen.SHOW_MOBILE_ENTER_WIDGET
            ? showMobilePhoneWidget(context)
            : showOtpFromWidget(context));
  }
}
