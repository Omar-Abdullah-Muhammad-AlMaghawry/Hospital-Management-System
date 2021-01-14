import 'dart:io';

import 'package:HMS/models/users.dart';
import 'package:provider/provider.dart';

import '../doctors/Form_Screen.dart';
import '../../widget/user_image_picker.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/gender.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
//import '';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  final Function toggleView;
  Register({this.toggleView});
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmpassword = '';
  String error = '';
  String userName = '';
  String phoneNumber = '';
  String address = '';
  String backupEmail = "";
  String _date = DateFormat.yMMMd().format(DateTime.now());
  File _userImageFile;

  var _done = false;
  final List<String> userType = [
    'Doctor',
    'Patient',
    'Lab Specialist',
    'Radiology',
    'Front Desk'
  ];
  String currentUser = "";
  final List<String> gender = ["Male", "Female"];
  String currentGender = '';
  void _imagePickedfn(File image) {
    _userImageFile = image;
    _done = true;
  }

  //RegisterState({this.userName, this.email, this.phoneNumber, this.address});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //Colors.teal[500],
      appBar: AppBar(
        //  backgroundColor: Colors.teal[700],
        elevation: 0.0,
        title: Text('Registration Form '),
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                UserImagePicker(_imagePickedfn),
                TextFormField(
                  decoration:
                      inputTextDecoration.copyWith(hintText: 'User Name'),
                  validator: (val) => val.isEmpty ? 'Enter User Name' : null,
                  onChanged: (val) {
                    setState(() {
                      userName = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputTextDecoration.copyWith(hintText: 'Email'),
                  validator: (val) {
                    if (val.isEmpty) return 'Enter your department Email';
                    var i = val.indexOf("@");
                    if (!((val.contains('d', i) &&
                            val.contains('o', i + 1) &&
                            val.contains('c', i + 2) &&
                            val.contains('t', i + 3) &&
                            val.contains('o', i + 4) &&
                            val.contains('r', i + 5)) ||
                        (val.contains('p', i) &&
                            val.contains('a', i + 1) &&
                            val.contains('t', i + 2) &&
                            val.contains('i', i + 3) &&
                            val.contains('e', i + 4) &&
                            val.contains('n', i + 5) &&
                            val.contains('t', i + 6)) ||
                        (val.contains('f', i) &&
                            val.contains('r', i + 1) &&
                            val.contains('o', i + 2) &&
                            val.contains('n', i + 3) &&
                            val.contains('t', i + 4)) ||
                        (val.contains('r', i) &&
                            val.contains('a', i + 1) &&
                            val.contains('d', i + 2)) ||
                        (val.contains('l', i) &&
                            val.contains('a', i + 1) &&
                            val.contains('b', i + 2))))
                      return "Please Enter Valid Email";
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                //  SizedBox(height: 10.0),
                // TextFormField(
                //   decoration:
                //       inputTextDecoration.copyWith(hintText: 'Backup Email'),
                //   validator: (val) {
                //     if (val.isEmpty) return 'Enter your Gmail';
                //     var i = val.indexOf("@");
                //     if (!(val.contains('g', i) &&
                //         val.contains('m', i + 1) &&
                //         val.contains('a', i + 2) &&
                //         val.contains('i', i + 3) &&
                //         val.contains('l', i + 4)))
                //       return "Please Enter Your Gmail";
                //     return null;
                //   },
                //   onChanged: (val) {
                //     setState(() {
                //       backupEmail = val;
                //     });
                //   },
                // ),

                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration:
                      inputTextDecoration.copyWith(hintText: 'Password'),
                  validator: (val) =>
                      val.length < 6 ? 'Enter +6 chars password' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: inputTextDecoration.copyWith(
                      hintText: 'Confirm Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please re-enter password';
                    }
                    print(password);
                    print(confirmpassword);
                    if (password != confirmpassword) {
                      return "Password does not match";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      confirmpassword = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                // DropdownButtonFormField(
                //   decoration: inputTextDecoration,
                //   value: currentUser ?? 'Select user type',
                //   items: userType.map((userType) {
                //     return DropdownMenuItem(
                //       value: userType,
                //       child: Text('$userType'),
                //     );
                //   }).toList(),
                //   onChanged: (val) => setState(() => currentUser =val),
                // ),
                // SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      inputTextDecoration.copyWith(hintText: 'Phone Number'),
                  validator: (val) =>
                      val.isEmpty ? 'Enter a Phone Number' : null,
                  onChanged: (val) {
                    setState(() {
                      phoneNumber = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: inputTextDecoration.copyWith(hintText: 'Address'),
                  validator: (val) => val.isEmpty ? 'Enter your address' : null,
                  onChanged: (val) {
                    setState(() {
                      address = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                // DropdownButtonFormField(
                //   decoration: inputTextDecoration,
                //   value: currentGender ?? 'Gender',
                //   items: gender.map((gender) {
                //     return DropdownMenuItem(
                //       value: gender,
                //       child: Text('$gender'),
                //     );
                //   }).toList(),
                //   onChanged: (val) => setState(() => currentGender=val),
                // ),
                SizedBox(height: 10.0),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GenderField(['Male', 'Female'])),
                SizedBox(height: 10.0),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                      side: BorderSide(color: Colors.blueAccent)),
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(1940, 1, 1),
                        maxTime: DateTime.now(), onConfirm: (date) {
                      print('confirm $date');
                      _date = '${date.month} / ${date.day} / ${date.year}';
                      //_date = '${date.year} - ${date.month} - ${date.day}';
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    " $_date",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          " Birth date",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Color.fromRGBO(0, 153, 255, 1),
                  child: Text(
                    'Register ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    /*AuthService auth2 = AuthService(
                          date: _date,
                          address: address,
                          confirmpassword: confirmpassword,
                          email: email,
                          error: error,
                          password: password,
                          phoneNumber: phoneNumber,
                          userName: userName);*/
                    FocusScope.of(context).unfocus();
                    if (_done == false) {
                      return Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "You have to pick up an Image",
                        ),
                        backgroundColor: Theme.of(context).errorColor,
                      ));
                    }
                    if (_formKey.currentState.validate()) {
                      // var index = email.indexOf('@');
                      // if (email.contains('d', index))
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => FormScreen()));

                      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormScreen()));
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          date: _date,
                          address: address,
                          confirmpassword: confirmpassword,
                          email: email,
                          backupEmail: backupEmail,
                          error: error,
                          password: password,
                          phoneNumber: phoneNumber,
                          userName: userName,
                          image: _userImageFile);

                      if (result == null) {
                        setState(() {
                          error = 'Please enter a vaild email ';
                        });
                      }

                      //return either doctor home or patient home widget

                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
