import 'dart:io';

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final isloading;
  final void Function(String userName, String email, String password,
      bool isLogin, BuildContext context) submitFn;
  AuthForm(this.submitFn, this.isloading);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _email = '';
  var _password = '';
  var _isLogIn = true;
  void _trysubmit() {
    var isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
          _userName.trim(), _email.trim(), _password, _isLogIn, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_isLogIn)
                          TextFormField(
                            key: Key("UserName"),
                            validator: (userName) {
                              if (userName.isEmpty || userName.length < 4) {
                                return "User Nam have to be more than 4 ";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(labelText: "User Name"),
                            onSaved: (userName) {
                              _userName = userName;
                            },
                          ),
                        TextFormField(
                          key: Key("email"),
                          validator: (email) {
                            if (email.isEmpty || !email.contains('@')) {
                              return "email have to contain @";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: "email"),
                          onSaved: (email) {
                            _email = email;
                          },
                        ),
                        TextFormField(
                          key: Key("password"),
                          validator: (password) {
                            if (password.isEmpty || password.length < 7) {
                              return "aPassword have to be more than 7 ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "passowrd",
                          ),
                          obscureText: true,
                          onSaved: (password) {
                            _password = password;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        if (widget.isloading) CircularProgressIndicator(),
                        if (!widget.isloading)
                          RaisedButton(
                              child: Text(_isLogIn ? "Login" : "Sign Up"),
                              onPressed: _trysubmit),
                        if (!widget.isloading)
                          FlatButton(
                            child: Text(_isLogIn
                                ? "Create a new account"
                                : "I already have An account"),
                            onPressed: () {
                              setState(() {
                                _isLogIn = !_isLogIn;
                              });
                            },
                          )
                      ],
                    ))),
          )),
    );
  }
}
