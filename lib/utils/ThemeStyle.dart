import 'package:flutter/material.dart';

///Defines the theme style and general color, sizing, text, etc
class ThemeStyle {
  ///Defining the colors of the app
  ///
  ///primColor = orange tone
  static final primColor = Color(0xFFd84315);
  ///secondaryMainColor = red tone
  static final secondaryMainColor = Color(0xFFC62828);
  ///constrastColor = yellow tone
  static final contrastColor = Color(0xFFF9A825);

  ///greyColor = dark grey tone
  static final greyColor = Colors.grey[800];

  ///lightGreyColor = light grey tone
  static final lightGreyColor = Colors.grey[200];

  ///whiteColor = white tone
  static final whiteColor = Colors.white;

  ///blackColor = black tone
  static final blackColor = Colors.black;

  ///marginAll = 8 pixel overall value
  static final marginALL = EdgeInsets.all(10);

  ///iconSize = 30 pixels
  static final iconSize = 30.0;

  ///borderRadiusStyle = Circular Radius of 30 pixels
  static final borderRadiusStyle = BorderRadius.all(Radius.circular(30));

  ///baseTextStyle = font is defined to be Roboto
  static final baseTextStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  ///appBarStyle = to be used for the title in an AppBar
  static final appBarStyle = baseTextStyle.copyWith(
    color: whiteColor,
    fontSize: 20,
  );

  ///heading --> Roboto font, size 24, .6 letter spacing, and bold 
  static final heading = baseTextStyle.copyWith(
    fontSize: 24,
    letterSpacing: .6,
    fontWeight: FontWeight.bold,
  );

  ///formLabelText --> Roboto font, black color, size 16, .2 letter spacing
  static final formLabelText = baseTextStyle.copyWith(
    color: blackColor,
    fontSize: 16,
    letterSpacing: .2,
  );

  

}