import 'dart:developer';

import 'package:HMS/widget/appointment/my_apointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:quiver/time.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class NewEditDeleteAppointment extends StatefulWidget {
  final bool changeTime;
  String idOfCard = '';
  var deleteAppoint = false;
  NewEditDeleteAppointment(
      {this.changeTime, this.idOfCard, this.deleteAppoint});

  @override
  _NewEditDeleteAppointmentState createState() =>
      _NewEditDeleteAppointmentState();
}

class _NewEditDeleteAppointmentState extends State<NewEditDeleteAppointment> {
  final _formKeyA = GlobalKey<FormState>();
  var _departmentName = '';
  var _doctorOrAnlysisName = '';
  var _dateOfReservation = '';
  var _timeOfReservation = '';
  TextEditingController _controller1, _controller2, _controller3, _controller4;
//  DocumentReference refrence;
  var _isLoading = false;
  var _isChange = false;
  var _isDelete = false;
  var _isClinic = true;
  String x = '';
  final cardID = FirebaseFirestore.instance.collection("appointments").doc().id;
  void _changeDateAndTime() async {
    FocusScope.of(context).unfocus();
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();
    _isChange = true;
    _formKeyA.currentState.save();
    await FirebaseFirestore.instance
        .collection("appointments")
        .document(widget.idOfCard)
        .update({
      'time_Reservation': _timeOfReservation,
      'date_Reservation': _dateOfReservation
    });
    // Firestore.instance
    //                 .runTransaction((Transaction transaction) async {
    //               CollectionReference reference =
    //               Firestore.instance.collection('appointments');
    //               await reference.
  }

  void _delete() async {
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();
    _isDelete = true;
    await FirebaseFirestore.instance
        .collection("appointments")
        .document(widget.idOfCard)
        .delete();
//     Firestore.instance.runTransaction((Transaction myTransaction) async {
//     await myTransaction.delete();
// });
  }

  void _submitResrvation() async {
    x = cardID;
    FocusScope.of(context).unfocus();
    final _user = FirebaseAuth.instance.currentUser;
    var _isValid = _formKeyA.currentState.validate();
    if (_isValid) {
      _formKeyA.currentState.save();
      // _isLoading = true;
      final userDate = await FirebaseFirestore.instance
          .collection("users")
          .document(_user.uid)
          .get();
      // await FirebaseFirestore.instance
      //     .collection("appointments")
      //     .document(getId());

      FirebaseFirestore.instance
          .collection("appointments")
          .document(cardID)
          .set({
        'userId': _user.uid,
        'UserName': userDate["userName"],
        'department': _departmentName.trim(),
        'doctorOrAnlysisName': _isClinic
            ? "Doctor : " + _doctorOrAnlysisName.trim()
            : "Name : " + _doctorOrAnlysisName.trim(),
        'date_Reservation': _dateOfReservation,
        'time_Reservation': _timeOfReservation,
        "title": _isClinic ? "Clinic" : _departmentName.trim(),
        "created At": Timestamp.now(),
        "cardID": cardID,
      });
      _isLoading = false;
    }
    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
  }

  @override
  Widget build(BuildContext context) {
    // MyAppointmenyt(
    //   dateOfReservation: dateOfReservation,
    //   timeOfReservation: timeOfReservation,
    //   isChange: _isChange,
    //   isdelete: _isDelete,
    // );

    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKeyA,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value.isEmpty) return "Please Enter The Department";
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //       labelText:
                  //           "Which department do you want make your Reservation ..?"),
                  //   onSaved: (value) {
                  //     setState(() {
                  //       _departmentName = value;
                  //     });
                  //   },
                  // ),
                  // DropdownButtonFormField(
                  //     items: [
                  //       DropdownMenuItem(child: Text("Analaysis")),
                  //       DropdownMenuItem(child: Text("Radiation"))
                  //     ],
                  //     onChanged: () {
                        
                  //     }),
                  if (!(widget.deleteAppoint))
                    if (!(widget.changeTime))
                      TextFormField(
                        key: ValueKey("Department"),
                        controller: _controller1,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please Enter The Department";
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: _isClinic
                                ? "Which department do you want make your Reservation ..?"
                                : "Analysis or Radiation, Which one do you want"),
                        onSaved: (value) {
                          setState(() {
                            _departmentName = value;
                          });
                        },
                      ),
                  if (!(widget.deleteAppoint))
                    if (!widget.changeTime)
                      TextFormField(
                        key: ValueKey("Doctor"),
                        controller: _controller2,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please Enter The Name Of the Doctor";
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: _isClinic
                                ? "The Name of Doctor, you want make your Reservation with..?"
                                : "The Name of Analysis/RadiationThe, you want to do..?"),
                        onSaved: (value) {
                          setState(() {
                            _doctorOrAnlysisName = value;
                          });
                        },
                      ),
                  if (!(widget.deleteAppoint))
                    DateTimeField(
                        key: ValueKey("Date"),
                        controller: _controller3,
                        onSaved: (value) {
                          setState(() {
                            String formatDate =
                                DateFormat.yMMMd().format(value);
                            _dateOfReservation = formatDate;
                          });
                        },
                        decoration:
                            InputDecoration(labelText: "please Enter The Date"),
                        // onSaved: (value) {
                        //   _dateOfReservation = value;
                        // },
                        format: DateFormat("yyyy-MM-dd"),
                        onShowPicker: (ctx, value) {
                          return showDatePicker(
                            context: ctx,
                            initialDate: value ?? DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2100),
                          );
                        }),
                  if (!(widget.deleteAppoint))
                    DateTimeField(
                        key: ValueKey("Time"),
                        //  key: _formKeyA,
                        controller: _controller4,
                        onSaved: (value) {
                          setState(() {
                            String formatTime = DateFormat.Hm().format(value);
                            _timeOfReservation = formatTime;
                          });
                        },
                        decoration:
                            InputDecoration(labelText: "please Enter The Time"),
                        format: DateFormat("hh:mm a"),
                        onShowPicker: (ctx, value) async {
                          final time = await showTimePicker(
                            context: ctx,
                            initialTime:
                                TimeOfDay.fromDateTime(value ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
                        }),
                  if ((widget.deleteAppoint))
                    Text("Do you Want to Cancel the Appointment"),
                  SizedBox(
                    height: 12,
                  ),
                  if (_isLoading) CircularProgressIndicator(),
                  if (!_isLoading)
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(!widget.changeTime & !widget.deleteAppoint
                          ? "Reserve"
                          : widget.changeTime
                              ? "Change"
                              : "Confirm"),
                      onPressed: !widget.changeTime & !widget.deleteAppoint
                          ? _submitResrvation
                          : widget.changeTime
                              ? _changeDateAndTime
                              : _delete,
                    ),
                  SizedBox(
                    height: 2,
                  ),
                  if (!(widget.deleteAppoint))
                    if (!widget.changeTime)
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _isClinic = !_isClinic;
                            });
                          },
                          child: Text(_isClinic
                              ? "Anlysis/Radiation Reservaing"
                              : "Clinic Reservation")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
