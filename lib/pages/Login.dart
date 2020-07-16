import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: ThemeStyle.marginALL,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        Constants.LOGO_IMAGE_PATH,
                        width: ScreenUtil().setWidth(250),
                        height: ScreenUtil().setHeight(250),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          "Shardha Shinkara Seva",
                          maxLines: 2,
                          style: TextStyle(
                            letterSpacing: .6,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}