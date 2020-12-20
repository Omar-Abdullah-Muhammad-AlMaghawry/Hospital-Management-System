import 'package:HMS/widget/CardWidget.dart';
import 'package:HMS/widget/appointment/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppointmenyt extends StatelessWidget {
  bool isChange=false;
  var isdelete=false;
  var timeOfReservation = '';
  var dateOfReservation = '';
  MyAppointmenyt(
      {this.isChange,
      this.isdelete,
      this.dateOfReservation,
      this.timeOfReservation});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("appointments")
            .orderBy("created At")
            .snapshots(),
        builder: (ctx, appointSnapshot) {
          final appointmentDocs = appointSnapshot.data.documents;
          // if (isChange == true) {
          //   appointmentDocs.update({
          //     'time_Reservation': timeOfReservation,
          //     'date_Reservation': dateOfReservation
          //   });
          // }
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
          //       if (isChange == true) {
          //   appointmentDocs.update({
          //     'time_Reservation': timeOfReservation,
          //     'date_Reservation': dateOfReservation
          //   });
          // }
//          if(isdelete==true) 
//           Firestore.instance.runTransaction((Transaction myTransaction) async {
//     await myTransaction.delete(appointSnapshot.data.documents[index].reference);
// });
                return CardAppointment(

                  department: appointmentDocs[index]["department"],
                  doctor: appointmentDocs[index]["doctorOrAnlysisName"],
                  time:isChange==true ? timeOfReservation:appointmentDocs[index]["time_Reservation"],
                  titleOfCardApp: appointmentDocs[index]["title"],
                  date: appointmentDocs[index]["date_Reservation"],
                  cardId:appointmentDocs[index]["cardID"],
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
