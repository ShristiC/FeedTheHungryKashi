import 'package:flutter/material.dart';
import './pages/HomePage.dart';
import './pages/Login.dart';
import './pages/Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shardha Shinkara Seva',
      home: Login(),
      routes: <String, WidgetBuilder> {
        '/landingpage':(BuildContext context) => MyApp(),
        '/login': (BuildContext context) => Login(),
        '/homepage': (BuildContext context) => HomePage(),
        '/settings': (BuildContext context) => Settings(),
        '/finishedpage': (BuildContext context) => Settings(),
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}

