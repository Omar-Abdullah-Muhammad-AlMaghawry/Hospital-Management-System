import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../authenticate/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatelessWidget {
  var userName = '';
  var email = '';
  var adresss = '';
  var phoneNumber = '';
  var birthDate = '';
  String image_url;
  static const nameRoute = "/my-profile";
  var result;
  final AuthService _auth = AuthService();
  final current = FirebaseAuth.instance.currentUser;
  //String userName = RegisterState().userName;
  // Future mm() async {
  //   final current = await FirebaseAuth.instance.currentUser;
  //   FutureBuilder(
  //     future: FirebaseFirestore.instance
  //         .collection("users")
  //         .document(current.uid)
  //         .get(),
  //     builder: (context, snapshots) {
  //       final userDocs = snapshots.data;
  //       return;
  //     },
  //   );
  //   //return
  //   return current;
  //   // );
  // }

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
              Navigator.of(context).pop();
              await _auth.signOut();
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("users")
              .document(current.uid)
              .get(),
          builder: (context, snapshots) {
            final userDocs = snapshots.data;
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                  ),
                  Center(
                    child: Container(
                      // width: 200,
                      // height: 200,

                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(userDocs['image_url']),
                        radius: 80,
                      ),
                      // Icon(
                      //   Icons.account_circle_outlined,
                      //   size: 80.0,
                      // ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Name :' + userDocs['userName'],
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      SizedBox(height: 20.0),
                      Text('Email :' + userDocs['email'],
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      SizedBox(height: 20.0),
                      Text('Address :' + userDocs["address"],
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      SizedBox(height: 20.0),
                      Text('Phone Number :' + userDocs["phoneNumber"],
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      SizedBox(height: 20.0),
                      Text('Birth date :' + userDocs["birthDate"],
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
