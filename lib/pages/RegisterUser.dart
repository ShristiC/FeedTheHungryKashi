import 'package:flutter/material.dart';
import '../utils/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterUser extends StatefulWidget {
  final _context;
  RegisterUser({Key key, BuildContext context}) : _context = context, super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  //variables for saving information so that it can be sent later
  final GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String name, idCardNumber, city, state, phoneNumber;
  final dbRef = FirebaseDatabase.instance.reference().child('recipientData');

  ///checks if name input is empty or invalid characters
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
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
    } else if (!regExp.hasMatch(value)) {
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
    } else if (!regExp.hasMatch(value)) {
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
    } else if (!regExp.hasMatch(value)) {
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
    else if (!regExp.hasMatch(value)) {
      return "Phone number must be digits";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                onSaved: (String val) {
                  name = val;
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
                onSaved: (String val) {
                  idCardNumber = val;
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
                onSaved: (String val) {
                  city = val;
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
                onSaved: (String val) {
                  state = val;
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
                  onSaved: (String val) {
                    phoneNumber = val;
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
                if (_key.currentState.validate()) {
                  dbRef.push().set({
                    "name": name,
                    "idCardNumber": idCardNumber,
                    "city": city,
                    "state": state,
                    "phoneNumber": phoneNumber,
                  }).then((_) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Successfully Added User")));
                  }).catchError((onError) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
                  });
                  // No any error in validation
                  _key.currentState.save();
                  Navigator.pushReplacementNamed(widget._context, '/finishedpage');
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
    );
  }
}