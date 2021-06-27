import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  final String text;

  ChatMessage({Key? key, required this.text}) : super(key: key);

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  String _name = "Pranav";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(widget.text),
              )
            ],
          )
        ],
      ),
    );
  }
}
