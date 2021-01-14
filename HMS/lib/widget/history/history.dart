import 'package:HMS/moduls/checker_appointments.dart';
import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/widget/CardWidget.dart';
import 'package:HMS/widget/appointment/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatelessWidget {
  Reciever sender;
  History({this.sender});
  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("appointments")
            .orderBy("created At")
            .snapshots(),
        builder: (ctx, appointSnapshot) {
          final appointmentDocs = appointSnapshot.data.documents;
          if (appointSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(

              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: appointmentDocs.length ?? 0,
              itemBuilder: (ctx, index) {
               try {
                  return Checker(
                    senderPatientId: appointmentDocs[index]['senderPatientId'],
                    //  recieverDoctorId: appointmentDocs[index]['recieverDoctorId'],
                    department: appointmentDocs[index]["department"],
                    doctor: appointmentDocs[index]["doctorOrAnlysisName"],
                    senderpatientName: appointmentDocs[index]
                        ["senderPatientName"],
                    time: appointmentDocs[index]["time_Reservation"],
                    titleOfCardApp: appointmentDocs[index]["title"],
                    date: appointmentDocs[index]["date_Reservation"],
                    cardId: appointmentDocs[index]["cardID"],
                    isAppointment: false,
                    isDoctor: false,
                    diagnose: appointmentDocs[index]["diagnosis"],
                    treatment: appointmentDocs[index]["treatment"],
                    id: sender.id,
                    // isClinic:appointmentDocs[index]['recieverDoctorId']as String ,
                  ).checkHistory();
               } 
                catch (err) {
                  Center();
                }
              });
        });
    // ],
//   );
  }
}
