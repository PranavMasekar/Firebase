import 'package:flutter/material.dart';
import 'jsonmodel.dart';

class HomePageJsonApp extends StatefulWidget {
  @override
  _HomePageJsonAppState createState() => _HomePageJsonAppState();
}

class _HomePageJsonAppState extends State<HomePageJsonApp> {
  late List<Model> _model;
  void initState() {
    super.initState();
    setState(() {
      _model = Model as List<Model>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index) {
              Model model = _model[index];
              return ListTile(
                title: Text(model.name),
                subtitle: Text(model.age),
              );
            },
            itemCount: _model.length),
      ),
    );
  }
}
