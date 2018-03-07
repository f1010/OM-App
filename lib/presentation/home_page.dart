import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Teddycare HomePage"),
            backgroundColor: Colors.deepOrange),
        body: new Container(
            child: new Center(
                child: new Column(
          children: [
            new RaisedButton(
              child: new Text('Registration page'),
              onPressed: () {
                Navigator.of(context).pushNamed("/kids/register/1");
              },
            ),
          ],
        ))));
  }
}
