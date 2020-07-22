import 'package:Shardha_Shinkara_Seva/pages/FinishedPage.dart';
import 'package:Shardha_Shinkara_Seva/pages/Test.dart';
import 'package:flutter/material.dart';
import './pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shardha Shinkara Seva',
      //home: HomePage(),
      home: FinishedPage(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   HomePage.routeName: (context) => HomePage(),
      //   FinishedPage.routeName: (context) => FinishedPage(),
      // }
    );
  }
}
