import 'dart:developer';

import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:HMS/widget/history/history.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
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
      body: History(),
    );
  }
}
