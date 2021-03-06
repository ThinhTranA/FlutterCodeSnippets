import 'package:flutter/material.dart';
import 'package:clock_app/clock_body.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  // This widget is the root of your application
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Flutter Clock',
      theme: new ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      
      home: new Clock(),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ClockBody(),
        ],
      ),),
    );
  }
}
