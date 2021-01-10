

import 'package:HMS/moduls/stastistacsData_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/appointment/card_widget.dart';




class Checker {
  final String titleOfCardApp;
  final String department;
  final String doctor;
  final String senderPatientId;
  final String recieverDoctorId;
  final String senderpatientName;
  final String time;
  final Timestamp date;
  final String diagnose;
  final String treatment;
  final String cardId;
  final bool isAppointment;
  //final Function delete;
  // final int vaildButtons;
  final ValueKey key;
  Checker(
      {this.key,
      this.cardId,
      this.senderPatientId,
      this.recieverDoctorId,
      this.senderpatientName,
      @required this.isAppointment,
      this.titleOfCardApp,
      this.department,
      this.date,
      this.doctor,
      this.time,
      this.diagnose,
      this.treatment});
  Widget check() {
    var datetime = date.toDate();
    if (((datetime.isAfter(DateTime.now().subtract(Duration(days: 1))))))
      return CustomCard(
        titleOfCardApp: titleOfCardApp,
        department: department,
        doctor: doctor,
        senderPatientId: senderPatientId,
        recieverDoctorId: recieverDoctorId,
        senderpatientName: senderpatientName,
        time: time,
        date: date,
        diagnose: diagnose,
        treatment: treatment,
        cardId: cardId,
        isAppointment: isAppointment,
        key: key,
      );
    else
      return SizedBox();
  }

  List checkIfToday() {
    var datetime = date.toDate();
    var counter = 0;
    StastistacsData d1;
    StastistacsData d2;
    StastistacsData d3;
   StastistacsData d4;
    StastistacsData d5;
    if (FirebaseAuth.instance.currentUser.uid == recieverDoctorId) {
      if (DateFormat.yMMMd().format(datetime) ==
          DateFormat.yMMMd().format(datetime)) {
        counter++;
        d1 = StastistacsData(
            date: DateFormat.yMMMd().format(datetime), counter: counter);
      } else if (DateFormat.yMMMd().format(datetime) ==
          DateFormat.yMMMd().format(datetime.add(Duration(days: 1)))) {
        counter++;
        d2 = StastistacsData(
            date: DateFormat.yMMMd().format(datetime.add(Duration(days: 1))),
            counter: counter);
      } else if (DateFormat.yMMMd().format(datetime) ==
          DateFormat.yMMMd().format(datetime.add(Duration(days: 2)))) {
        counter++;
        d3 = StastistacsData(
            date: DateFormat.yMMMd().format(datetime.add(Duration(days: 2))),
            counter: counter);
      } else if (DateFormat.yMMMd().format(datetime) ==
              DateFormat.yMMMd().format(datetime.add(Duration(days: 3))) ||
          recieverDoctorId == FirebaseAuth.instance.currentUser.uid) {
        counter++;
        d4 = StastistacsData(
            date: DateFormat.yMMMd().format(datetime.add(Duration(days: 3))),
            counter: counter);
      } else if (DateFormat.yMMMd().format(datetime) ==
          DateFormat.yMMMd().format(datetime.add(Duration(days: 4)))) {
        counter++;
        d5 = StastistacsData(
            date: DateFormat.yMMMd().format(datetime.add(Duration(days: 4))),
            counter: counter);
      }
    }

    return [d1, d2, d3, d4, d5];
  }
}
