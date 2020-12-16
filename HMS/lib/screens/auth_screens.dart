import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:HMS/widget/auth/AuthWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  void _submitAuthForm(String userName, String email, String password,
      bool isLogin, BuildContext ctx) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection("users")
            .document(userCredential.user.uid)
            .set({'userName': userName, 'email': email});
      }
      setState(() {
        _isLoading = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        _isLoading = false;
      });
      var massage = ' An error Happen';
      if (err.message != null) {
        massage = err.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(massage),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      print(err);
      var massage = ' An error Happen';
      if (err.message != null) {
        massage = err.message;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(massage),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(_submitAuthForm,_isLoading)
      ,
    );
  }
}
