import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/ThemeStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        backgroundColor: ThemeStyle.primColor,
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
          //Sign out button
          Center(
            child: RaisedButton(
              onPressed: () {
                authService.signOut();
                Navigator.of(context).pushReplacementNamed('/landingpage');
              },
              child: Text("SIGN OUT"),
            ),
          ),
        ],
      ),
    );
  }
}