import 'dart:developer';

import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/screens/doctors/doctors_home_screen.dart';
import '../masterHome.dart';
import 'package:HMS/widget/appointment/doctor-list.dart';
import 'package:HMS/widget/appointment/listtile-doctor.dart';
import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/my_apointment_doctors.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:HMS/widget/main_drawer.dart';
import 'package:HMS/widgets/DoctorDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAppointmentDocScreen extends StatefulWidget {
  static const nameRoute = "/my-appointd-doc";
  @override
  _MyAppointmentDocScreenState createState() => _MyAppointmentDocScreenState();
}

class _MyAppointmentDocScreenState extends State<MyAppointmentDocScreen> {
  // void shtx(BuildContext context) {

  //   showModalBottomSheet(
  //       context: context,
  //       builder: (ctx) {

  //         return NewEditDeleteAppointment(
  //           changeTime: false,
  //           deleteAppoint: false,
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    // final niceArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final named = niceArgs["named"];
    return Scaffold(
      backgroundColor:Colors.white,
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
        title: Text("My Appointmets"),
      ),
    //  drawer: DoctorDrawer(),
      body: MyAppointmentDoc(),
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => shtx(context),
      // ),
    );
  }
}
