import 'package:flutter/material.dart';
import 'package:gdg_school/GradientAppBar.dart';
import 'package:gdg_school/WorkshopRow.dart';
import 'package:gdg_school/DetailPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: new Container(
        color: Colors.blue[900],
        child: Column(
        children: <Widget> [
          GradientAppBar(
              "GDG School"
          ),
          new Expanded(
            child : new Center(
              child : WorkshopRow(
              ),
            ),
          ),
        ]
      ),
      ),
    );
  }
}
