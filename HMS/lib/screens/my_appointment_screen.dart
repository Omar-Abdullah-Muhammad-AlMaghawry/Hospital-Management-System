import 'dart:developer';

import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/widget/appointment/doctor-list.dart';
import 'package:HMS/widget/appointment/listtile-doctor.dart';
import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:HMS/widget/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatefulWidget {
  static const nameRoute = "/my-appoint";
  @override
  _MyAppointmentScreenState createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {

  void shtx(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (ctx) {
       
          return NewEditDeleteAppointment(
            changeTime: false,
            deleteAppoint: false,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final niceArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final named = niceArgs["named"];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
        title: Text("My Appointmets"),
      ),
      drawer: MainDrawer(),
      body: MyAppointment(),
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
        onPressed: () => shtx(context),
      ),
    );
  }
}
