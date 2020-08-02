import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';
import './RegisterUser.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///designs the style for the App Bar on the homepage
  Widget _appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(75),
            height: ScreenUtil().setHeight(75),
            margin: ThemeStyle.marginALL,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Constants.LOGO_IMAGE_PATH),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Shardha Shinkara Seva',
            style: ThemeStyle.appBarStyle,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: ThemeStyle.whiteColor,
            iconSize: 40,
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      backgroundColor: ThemeStyle.secondaryMainColor,
      centerTitle: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    // necessary I think, gets ride of debug banner
    WidgetsApp.debugAllowBannerOverride = false;
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    return MaterialApp(
      home: new Scaffold(
        appBar: _appBar(),
        resizeToAvoidBottomPadding: true,
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: RegisterUser(),
          ),
        ),
      ),
    );
  }
}