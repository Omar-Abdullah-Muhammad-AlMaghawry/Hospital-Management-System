import 'dart:developer';

import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/screens/patient/patients_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/observer.dart';

import '../masterHome.dart';
import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import '../../widget/history/history.dart';
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
    final args = ModalRoute.of(context).settings.arguments as Reciever;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //  backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: Text(args == null
            ? "My Medical History"
            : "${args.name} Medical History"),
      ),
      //    drawer: MainDrawer(),
      body: !(args == null)
          ? History(
              sender: args,
            )
          : History(sender: args ?? Reciever(id: "0")),
    );
  }
}
