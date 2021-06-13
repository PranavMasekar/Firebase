import 'package:flutter/material.dart';
import 'dart:convert';

class HomePageJsonApp extends StatefulWidget {
  @override
  _HomePageJsonAppState createState() => _HomePageJsonAppState();
}

class _HomePageJsonAppState extends State<HomePageJsonApp> {
  List? data2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("load_json/person.json"),
            builder: (context, snapshot) {
              // Decode Json
              var data = jsonDecode(data2.toString());
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name :" + data[index]['name']),
                        Text("Age :" + data[index]['age']),
                        Text("Hair Color :" + data[index]['hairColor']),
                        Text("Gender :" + data[index]['gender']),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
