import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatefulWidget {
  final String titleOfCardApp;
  final String department;
  final String doctor;
  final String senderPatientId;
  final String recieverDoctorId;
  final String senderpatientName;
  final String time;
  //final String date;
  final Timestamp date;
  final String diagnose;
  final String treatment;
  final String cardId;
  final bool isAppointment;
  //final Function delete;
  // final int vaildButtons;
  final ValueKey key;
  CustomCard(
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

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  void change(context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
//          MyAppointmenyt(isChange: isChange,);
          return NewEditDeleteAppointment(
            changeTime: true,
            deleteAppoint: false,
            idOfCard: widget.cardId,
          );
        });
  }

  void delete(context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
//          MyAppointmenyt(isChange: isChange,);
          return NewEditDeleteAppointment(
            deleteAppoint: true,
            changeTime: false,
            idOfCard: widget.cardId,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.senderPatientId == FirebaseAuth.instance.currentUser.uid ||
        widget.recieverDoctorId == FirebaseAuth.instance.currentUser.uid)
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: Card(
            color: Color.fromRGBO(153, 238, 255, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromRGBO(68, 204, 255, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // Color.fromRGBO(153, 238, 255, 1),
                        margin: EdgeInsets.only(left: 5, right: 5),
                        color: Color.fromRGBO(68, 204, 255, 1),
                        child: Text(
                          widget.titleOfCardApp,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        // Color.fromRGBO(153, 238, 255, 1),
                        margin: EdgeInsets.only(left: 5, right: 5),
                        color: Color.fromRGBO(68, 204, 255, 1),
                        child: Text(
                         DateFormat.yMMMd().format( widget.date.toDate()),
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    color: Color.fromRGBO(153, 238, 255, 1),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        // Use children total size
                        children: [
                          Text(
                            "Department : " + widget.department,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.doctor,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Time : " + widget.time,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 17,
                            ),
                          ),
                          if (!widget.isAppointment)
                            Text(
                              "Diagnose the Disease : " + widget.diagnose,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 17,
                              ),
                            ),
                          if (!widget.isAppointment)
                            Text(
                              "The treatment : " + widget.treatment,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 17,
                              ),
                            ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.isAppointment)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // NiceButton(
                      //   nameOfButton: "Change U",
                      //   fontOfSize: 10,
                      // ),
                      // NiceButton(
                      //     nameOfButton: "Cancel the Reservation",
                      //     fontOfSize: 10)

                      Container(
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(0, 153, 255, 1),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Change ",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () => change(context),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(0, 153, 255, 1),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () => delete(context),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    else
      return Center();
  }
}
