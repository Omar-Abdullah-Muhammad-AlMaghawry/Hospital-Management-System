import 'dart:io';

import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:HMS/widget/appointment/new_edit_delete_appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

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
  final bool isDoctor;
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
      this.treatment,
      this.isDoctor});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  File _pickedImage;
  var isState = false;
  void addTreatment() async {
    File _pickedImageFile = File(
        await ImagePicker.pickImage(source: ImageSource.camera)
            .then((value) => value.path));
    final ref = FirebaseStorage.instance
        .ref()
        .child(widget.titleOfCardApp)
        .child(widget.cardId + '.jpg');
    await ref.putFile(_pickedImageFile);
    String url = await ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(widget.cardId)
        .update({'treatment': url});
    setState(() {
      isState = !isState;
    });
  }

  void addDiagnosis() {
    showBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter Diagnosis',
            ),
            onSubmitted: (diagnosis) {
              FirebaseFirestore.instance
                  .collection('appointments')
                  .doc(widget.cardId)
                  .update({'diagnosis': diagnosis});
              Navigator.pop(ctx);
            },
          ),
        );
      },
    );
    // FirebaseFirestore.instance
    //     .collection('abdo-partients-test')
    //     .doc(widget.cardId)
    //     .update({'diagnosis': 'asuism'});
  }

  void viewPatientHistory() {}
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
                          DateFormat.yMMMd().format(widget.date.toDate()),
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
                          if ((widget.isAppointment && widget.isDoctor) ||
                              !widget.isAppointment)
                            Text(
                              "Diagnosis: " + widget.diagnose,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 17,
                              ),
                            ),
                          if ((widget.isAppointment && widget.isDoctor) ||
                              !widget.isAppointment)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The treatment : ",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 17,
                                  ),
                                ),
                                Container(
                                  width: 210,
                                  padding: EdgeInsets.all(10),
                                  child: widget.treatment != ''
                                      ? Container(
                                          height: 300,
                                          child: PhotoView(
                                              enableRotation: true,
                                              imageProvider: NetworkImage(
                                                  widget.treatment != ""
                                                      ? widget.treatment
                                                      : null)),
                                        )
                                      // Image.network(
                                      //     widget.treatment,
                                      //     fit: BoxFit.fill,

                                      //   )
                                      : null,
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.isAppointment && !widget.isDoctor)
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
                if (widget.isAppointment && widget.isDoctor)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(0, 153, 255, 1),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Add diagnosis ",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10,
                            ),
                          ),
                          onPressed: addDiagnosis,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(0, 153, 255, 1),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Add treatment",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10,
                            ),
                          ),
                          onPressed: addTreatment,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromRGBO(0, 153, 255, 1),
                        ),
                        child: FlatButton(
                          child: Text(
                            "View history ",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10,
                            ),
                          ),
                          onPressed: viewPatientHistory,
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
