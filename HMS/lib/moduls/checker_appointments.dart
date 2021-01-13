import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/appointment/custom_card.dart';

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
  final bool isDoctor;
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
      this.treatment,this.isDoctor});
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
        isDoctor: isDoctor,
      );
    else
      return SizedBox();
  }
}
