import 'package:HMS/widget/CardWidget.dart';
import 'package:HMS/widget/appointment/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection("appointments/onePatient/" + _user.uid)
            .orderBy("created At")
            .snapshots(),
        builder: (ctx, appointSnapshot) {
          final appointmentDocs = appointSnapshot.data.documents;
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
                  doctor: appointmentDocs[index]["doctorOrAnlysisName"],
                  time:appointmentDocs[index]["time_Reservation"],
                  titleOfCardApp: "Clinic",
                  date: appointmentDocs[index]["date_Reservation"],
                  diagnose: "",
                  treatment: "",

                  isAppointment: false,
                );

              });
        });
    // ],
//   );
  }
}
