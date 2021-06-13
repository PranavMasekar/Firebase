import 'package:flutter/material.dart';
import 'package:many_apps/ChatApp/ChatMassage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _submitted(String text) {
    _text.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  final TextEditingController _text = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  Widget _textcomposewidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.purpleAccent),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Send a Message"),
                controller: _text,
                onSubmitted: _submitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () => _submitted(_text.text),
                icon: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textcomposewidget(),
        )
      ],
    );
  }
}
