import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/ThemeStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Mock Seettings Page to show the current user and have the option to sign out
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

///Helper class to initiate the user
class _SettingsState extends State<Settings> {
  FirebaseUser user;

  ///initiates the user
  _initializeUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = _user;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mock Settings',
          style: ThemeStyle.appBarStyle,
        ),
        backgroundColor: ThemeStyle.secondaryMainColor,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // user profile details
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 30,
            ),
            title: Text(
              user.displayName,
              style: ThemeStyle.heading,
            ),
            subtitle: Text(
              user.email,
              style: ThemeStyle.baseTextStyle,
            ),
          ),
          //Button!
          new InkWell(
            child: Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(100),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ThemeStyle.primColor,
                  ThemeStyle.secondaryMainColor,
                ]),
                borderRadius: new BorderRadius.circular(30.0),
                boxShadow: [new BoxShadow(
                  color: ThemeStyle.greyColor.withOpacity(.3),
                  offset: new Offset(0, -5),
                  blurRadius: 10
                )]
              ),
              child: Center(child: Text("SIGN OUT", style: ThemeStyle.buttonLabelText),),
            ),
            onTap: () {
              authService.signOut();
              Navigator.pushReplacementNamed(context, '/landingpage');
            },
          ),
        ],
      ),
    );
  }
}