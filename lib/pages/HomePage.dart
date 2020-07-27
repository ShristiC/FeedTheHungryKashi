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
  final _controller = TextEditingController();

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
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      backgroundColor: ThemeStyle.secondaryMainColor,
      centerTitle: true,
    );
  }
  
  ///styling for the TextInputForm
  Widget _textInputForm(String error, String label, IconData icon) {
    return Container(
      margin: ThemeStyle.marginALL,
      // actual TextForm Field
      child: TextFormField(
        controller: _controller,
        //validator creates a condition to be checked for when inputting response
        validator: (value) {
          return value.isEmpty ? error : null;
        },
        //creates the decoration for the input box
        decoration: InputDecoration(
          //outside border details
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeStyle.greyColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          //label text details
          alignLabelWithHint: true,
          labelText: label,
          labelStyle: ThemeStyle.formLabelText,
          //icon details
          prefixIcon: Icon(
            icon,
            size: ThemeStyle.iconSize,
            color: ThemeStyle.blackColor,
          ),
          //details when selecting that input box
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeStyle.primColor,
              width: 2,
            ),
            borderRadius: ThemeStyle.borderRadiusStyle,
          ),
          //filling in the color of the inside input box
          fillColor: ThemeStyle.lightGreyColor,
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //helps control the screen sizing 
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      appBar: _appBar(),
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: ListView(
          padding: ThemeStyle.marginALL,
          children: <Widget>[
            Center(
              child: Text(
                "Recipient Input Form",
                style: ThemeStyle.heading,
              ),
            ),
            ///calls the textInputForm method to handle the user input
            _textInputForm("Must enter a First Name", "First Name", Icons.person),
            _textInputForm("Must enter a Last Name", "Last Name", Icons.person),
            _textInputForm("Must enter a Adhar Pan Card Number", "Adhar Pan Card Number", Icons.account_balance_wallet),
            _textInputForm("Must enter a City", "City", Icons.map),
            _textInputForm("Must enter a State", "state", Icons.map),
            _textInputForm("Must enter a Phone Number", "Phone Number", Icons.phone),
          ],
        ),
      ),
    );
  }
}