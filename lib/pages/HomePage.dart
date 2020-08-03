import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variables for saving information so that it can be sent later
  final GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String name, idCardNumber, city, state, phoneNumber;
  final dbRef = FirebaseDatabase.instance.reference().child('recipientData');

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


  ///checks if name input is empty or invalid characters
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  ///checks if card input is empty or invalid inputs
  String validateCard(String value) {
    String patttern = r'(^[a-zA-Z0-9]\S)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Card number is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Card number must be digits";
    }
    return null;
  }

  ///checks if city input is empty
  String validateCity(String value) {
    String patttern = r'(^[a-zA-Z0-9 ]+$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "City is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name of City does not have a valid format";
    }
    return null;
  }

  ///checks if state input is empty
  String validateState(String value) {
    String patttern = r'(^[a-zA-Z ]+$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "State is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name of State does not have a valid format";
    }
    return null;
  }

  ///checks if phone number input is empty or invalid characters
  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Phone number is required";
    } else if(value.length != 10) {
      return "Invalid Phone Number";
    }
    else if (!regExp.hasMatch(value.trim())) {
      return "Phone number must be digits";
    }
    return null;
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
            child: Form(
              key: _key,
              autovalidate: _validate,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
                child: new Column(
                  children: <Widget>[
                    // header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: Text(
                          "Recipient Input Form",
                          style: ThemeStyle.heading,
                        ),
                      ),
                    ),
                    //first name
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeStyle.greyColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          //label text details
                          alignLabelWithHint: true,
                          labelStyle: ThemeStyle.formLabelText,
                          //icon details
                          prefixIcon: Icon(
                            Icons.person,
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
                        validator: validateName,
                        onChanged: (String val) {
                          setState(() {
                            name = val.trim();
                          });
                        },
                      ),
                    ),
                    // card number
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Aadhar Card or PAN Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeStyle.greyColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          //label text details
                          alignLabelWithHint: true,
                          labelStyle: ThemeStyle.formLabelText,
                          //icon details
                          prefixIcon: Icon(
                            Icons.account_balance_wallet,
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
                        validator: validateCard,
                        onChanged: (String val) {
                          setState(() {
                            idCardNumber = val.trim();
                          });
                        },
                      ),
                    ),
                    // city
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'City',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeStyle.greyColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          //label text details
                          alignLabelWithHint: true,
                          labelStyle: ThemeStyle.formLabelText,
                          //icon details
                          prefixIcon: Icon(
                            Icons.map,
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
                        validator: validateCity,
                        onChanged: (String val) {
                          setState(() {
                            city = val.trim();
                          });
                        },
                      ),
                    ),
                    // state
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'State',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeStyle.greyColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          //label text details
                          alignLabelWithHint: true,
                          labelStyle: ThemeStyle.formLabelText,
                          //icon details
                          prefixIcon: Icon(
                            Icons.map,
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
                        validator: validateState,
                        onChanged: (String val) {
                          setState(() {
                            state = val.trim();
                          });
                        },
                      ),
                    ),
                    // phone number
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Phone Number',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeStyle.greyColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            //label text details
                            alignLabelWithHint: true,
                            labelStyle: ThemeStyle.formLabelText,
                            //icon details
                            prefixIcon: Icon(
                              Icons.phone,
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
                          keyboardType: TextInputType.phone,
                          validator: validateMobile,
                          onChanged: (String val) {
                            setState(() {
                              phoneNumber = val.trim();
                            });
                          }),
                    ),
                    new SizedBox(height: 15.0),
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
                        child: Center(child: Text("SUBMIT", style: ThemeStyle.buttonLabelText),),
                      ),
                      onTap: () {
                        print(name);
                        print(idCardNumber);
                        print(city);
                        print(state);
                        print(phoneNumber);
                        if (_key.currentState.validate()) {
                          dbRef.push().set({
                            "name": name,
                            "idCardNumber": idCardNumber,
                            "city": city,
                            "state": state,
                            "phoneNumber": phoneNumber,
                          }).then((_) {
                            print("Successfully added user");
                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Successfully Added User")));
                          }).catchError((onError) {
                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
                            print(onError);
                          });
                          // No any error in validation
                          _key.currentState.save();
                          Navigator.pushReplacementNamed(context, '/finishedpage');
                        } else {
                          // validation error
                          setState(() {
                            _validate = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}