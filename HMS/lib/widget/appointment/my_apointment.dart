import 'package:HMS/widget/patient_home/NiceButton.dart';
import 'package:HMS/widget/CardWidget.dart';
import 'package:HMS/widget/appointment/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppointmenyt extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("appointments")
            .orderBy("created At")
            .snapshots(),
        builder: (ctx, appointSnapshot) {
          final appointmentDocs = appointSnapshot.data.documents;
          // var appiontmentList = [];
          // for (var i = 0; i <= appointmentDocs.length; i++) {
          //   (appointmentDocs[i] as Map).forEach((field, value) {
          //     appiontmentList.add(field+value);
          //   });
          // }

          if (appointSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(

              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: appointmentDocs.length ?? 0,
              itemBuilder: (ctx, index) {
                return CardAppointment(
                  department: appointmentDocs[index]["department"],
                  doctor: appointmentDocs[index]["doctor"],
                  time: appointmentDocs[index]["time_Reservation"],
                  titleOfCardApp: "Clinic",
                  date: appointmentDocs[index]["date_Reservation"],
                  isAppointment: true,
                );
                // return CardAppointment(
                //   department: appiontmentList[index],
                //   doctor: appiontmentList[index],
                //   time: appiontmentList[index],
                //   titleOfCardApp: "Clinic",
                //   date: appiontmentList[index],
                //   isAppointment: true,
                // );
              });
        });
    // ],
//   );
  }
}
