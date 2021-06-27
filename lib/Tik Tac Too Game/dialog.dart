import 'package:flutter/material.dart';

class CustomDailog extends StatelessWidget {
  String title = "";
  final content;
  final VoidCallback callback;
  final actiontext;

  CustomDailog(this.callback, this.title, this.content,
      [this.actiontext = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        GestureDetector(
          onTap: callback,
          child: Container(
            color: Colors.white,
            child: Text(actiontext),
          ),
        )
      ],
    );
  }
}
