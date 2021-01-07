import 'package:flutter/material.dart';
import 'package:HMS/services/auth.dart';
import 'package:HMS/shared/constants.dart';
import 'package:HMS/shared/gender.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  String _date = (DateTime.now()).toString();

  //RegisterState({this.userName, this.email, this.phoneNumber, this.address});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
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
                  decoration: inputTextDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
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
                TextFormField(
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
                  color: Colors.pink[400],
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
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          date: _date,
                          address: address,
                          confirmpassword: confirmpassword,
                          email: email,
                          error: error,
                          password: password,
                          phoneNumber: phoneNumber,
                          userName: userName);

                      if (result == null) {
                        setState(() {
                          error = 'Please enter a vaild email ';
                        });
                      }
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
