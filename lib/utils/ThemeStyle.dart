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

  ///whiteColor = white tone
  static final whiteColor = Colors.white;

  ///blackColor = black tone
  static final blackColor = Colors.black;

  static final marginALL = EdgeInsets.all(8);

  static final baseTextStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  static final appBarStyle = baseTextStyle.copyWith(
    color: whiteColor,
    fontSize: 20,
  );

  static final heading = baseTextStyle.copyWith(
    fontSize: 24,
    letterSpacing: .6,
    fontWeight: FontWeight.bold,
  );
  

}