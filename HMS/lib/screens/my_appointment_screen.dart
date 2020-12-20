import 'dart:developer';

import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatefulWidget {
  @override
  _MyAppointmentScreenState createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
 void shtx  (BuildContext context) {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return NewEditDeleteAppointment(changeTime: false,deleteAppoint: false,);
                });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppointmenyt(),
      //     SingleChildScrollView(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min, // Use children total size
      //  children:[ Expanded(
      //         child: MyAppointmenyt(),
      //       ),]
      //     ),
      //      ),
      //      ),
      //bottomSheet: NewAppointment(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:()=>shtx(context),
          ),
    );
  }
}
