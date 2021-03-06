import './sign_in.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import 'package:HMS/shared/constants.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
  // final Function toggleView;
  //SignIn({this.toggleView});
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          //    backgroundColor: Colors.teal[700],
          elevation: 0.0,
          title: Text('Reset Password'),
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
                        'Buckup E-mail',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: inputTextDecoration.copyWith(
                          hintText: 'Enater Your Buckup Email'),
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Color.fromRGBO(0, 153, 255, 1),
                      child: Text(
                        'Send Request ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _auth.resetPassword(email);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
