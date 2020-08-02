import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';


import 'package:Shardha_Shinkara_Seva/pages/FinishedPage.dart';
import './pages/HomePage.dart';
import './pages/Login.dart';
import './pages/Settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final FirebaseApp app = await FirebaseApp.configure(
  //   name: 'Shardha Shinkara Seva App', 
  //   options: const FirebaseOptions(
  //     googleAppID: null
  //   ),
  // );
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
        '/finishedpage': (BuildContext context) => FinishedPage(),
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}

