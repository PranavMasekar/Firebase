import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomePageChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OP Chat "),
      ),
      body: ChatScreen(),
    );
  }
}
