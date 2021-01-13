import 'dart:developer';

import 'package:HMS/pages/masterHome.dart';
import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:HMS/widget/history/history.dart';
import 'package:HMS/widget/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  static const nameRoute = "/my-history";
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
//  void shtx  (BuildContext context) {
//             showModalBottomSheet(
//                 context: context,
//                 builder: (ctx) {
//                   return NewEditDeleteAppointment(changeTime: false,deleteAppoint: false,);
//                 });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text('Log out',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(MasterHome.nameRoute));

              FirebaseAuth.instance.signOut();
            },
          )
        ],
        title: Text("My Medical History"),
      ),
      //    drawer: MainDrawer(),
      body: History(),
    );
  }
}
