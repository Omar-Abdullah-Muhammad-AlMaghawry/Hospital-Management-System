import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication/services/auth.dart';
import 'package:authentication/screens/authenticate/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  AuthResult result;
  final AuthService _auth = AuthService();
  //String userName = RegisterState().userName;
  Future mm() async {
    final current = await FirebaseAuth.instance.currentUser();
    FutureBuilder(
      future:
          Firestore.instance.collection("users").document(current.uid).get(),
      builder: (context, index) {
        //Firestore.instance.collection("users").document(var11.uid).get()
        // ["userName"];
      },
    );
    //return
    return current;
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(
          title: Text('My Profile'),
          backgroundColor: Colors.teal[700],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text('Log out',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 80.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Text('User Name :',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
              SizedBox(height: 20.0),
              Text('Email :',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
              SizedBox(height: 20.0),
              Text('Address :',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
              SizedBox(height: 20.0),
              Text('Gender :',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
              SizedBox(height: 20.0),
              Text('Birth date :',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            ])));
  }
}
