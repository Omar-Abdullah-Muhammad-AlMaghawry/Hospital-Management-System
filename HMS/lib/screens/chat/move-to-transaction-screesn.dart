import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './doctorchatlist.dart';
import './frontchatlist.dart';
import './patientchatlist.dart';

class FrontNavigator extends StatefulWidget {
  @override
  _FrontNavigatorState createState() => _FrontNavigatorState();
}

class _FrontNavigatorState extends State<FrontNavigator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Theme.of(context).backgroundColor,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Chat'),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text('Home',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Theme.of(context).themeAppBar.color,
                  width: 250,
                  child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FrontChatList(),
                          ),
                        );
                      },
                      child: Text('Patients Chat List')),
                ),
                Container(
                  //  color:Theme.of(context).themeAppBar.color,
                  width: 250,
                  child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientChatList(),
                          ),
                        );
                      },
                      child: Text('Doctors Chat List')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
