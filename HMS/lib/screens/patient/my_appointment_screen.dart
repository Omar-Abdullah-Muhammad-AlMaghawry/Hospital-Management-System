import 'dart:developer';

import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/screens/patient/patients_home_screen.dart';
import '../masterHome.dart';
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
      backgroundColor:Theme.of(context).backgroundColor,
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
               Navigator.popUntil(context, ModalRoute.withName(PatientHomeScreen.nameRoute));

            },
          )
        ],
        title: Text("My Appointmets"),
      ),
 //     drawer: MainDrawer(),
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
