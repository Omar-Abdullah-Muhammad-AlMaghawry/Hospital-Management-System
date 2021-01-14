import 'package:HMS/screens/chat/doctorchatlist.dart';
import 'package:HMS/screens/chat/frontchatlist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorNavigator extends StatefulWidget {
  @override
  _DoctorNavigatorState createState() => _DoctorNavigatorState();
}

class _DoctorNavigatorState extends State<DoctorNavigator> {
  String x = 'FrontChatList';
  FrontChatList front;
  DoctorChatList doc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
   //   color: Theme.of(context).backgroundColor,
      home:  Scaffold(
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
                    //color:Theme.of(context).themeAppBar.color,
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
                        child: Text('Inform-Desk Chat List')),
                  ),
                  Container(
                    // color:Theme.of(context).themeAppBar.color,
                    width: 250,
                    child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorChatList(),
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
