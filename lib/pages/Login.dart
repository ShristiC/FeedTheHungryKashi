import 'package:Shardha_Shinkara_Seva/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';

///Login Page for google sign in
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //deals with the logo --> UI can be improved
  Widget _logo() {
    return Container(
      width: double.infinity,
      child: ListTile(
        leading:Image.asset(
          Constants.LOGO_IMAGE_PATH,
          fit: BoxFit.fill,
          width: 100,
        ), 
        title: Container(
          child: Text(
            "Shardha Shinkara Seva",
            maxLines: 2,
            style: ThemeStyle.heading,
            textAlign: TextAlign.center,
          ),
        ), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: ThemeStyle.marginALL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _logo(),
            //sets a buffer
            Container(margin: EdgeInsets.all(20)),
            //creates the standard google sign in button
            GoogleSignInButton(
              onPressed: () {
                authService.googleSignIn();
                Navigator.of(context).pushReplacementNamed('/homepage');
              },
              darkMode: true,
            ),               
          ],
        ),
      ),
        
    );
  }
}