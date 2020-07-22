import 'package:Shardha_Shinkara_Seva/utils/Constants.dart';
import 'package:Shardha_Shinkara_Seva/utils/ThemeStyle.dart';
import "package:flutter/material.dart";

import 'HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedPage extends StatefulWidget {
  static const String routeName = "/finished";
  @override
  _FinishedPageState createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
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
        body: Stack(
          children: <Widget>[
            Container(
              color: ThemeStyle.lightGreyColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 308.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                        top: 100, bottom: 100, left: 32, right: 32),
                    child: Text("Your information has been submitted."),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
