import 'package:authentication/screens/authenticate/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:authentication/services/auth.dart';
import 'package:authentication/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
  final Function toggleView;
  SignIn({this.toggleView});
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(
          backgroundColor: Colors.teal[700],
          elevation: 0.0,
          title: Text('Sign in'),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Register',
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
                    Container(
                      child: Text(
                        'E-mail',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          inputTextDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(20.0),
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
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Sign In ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() => error = 'Unvalid credentials');
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(height: 12.0),
                    TextButton(
                      child: Text('Forget Pasword?'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
