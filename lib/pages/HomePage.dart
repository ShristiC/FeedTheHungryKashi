import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: ThemeStyle.secondaryMainColor,
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: ListView(
          padding: ThemeStyle.marginALL,
          children: <Widget>[
            Center(
              child: Text(
                "Recipient Input Form",
                style: ThemeStyle.heading.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}