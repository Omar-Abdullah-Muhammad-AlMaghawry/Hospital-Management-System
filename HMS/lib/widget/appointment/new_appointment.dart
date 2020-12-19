import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:quiver/time.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class NewAppointment extends StatefulWidget {
  final bool changeTime;
  NewAppointment({@required this.changeTime});

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final _formKeyA = GlobalKey<FormState>();
  var _departmentName = '';
  var _doctorName = '';
  var _dateOfReservation = '';
  var _timeOfReservation = '';
  var _isLoading = false;
  String x = '';
  final cardID = FirebaseFirestore.instance.collection("appointments").doc().id;
  void _changeDateAndTime() async {
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();

    await FirebaseFirestore.instance
        .collection("appointments")
        .document(x)
        .update({
      'time_Reservation': _timeOfReservation,
      'date_Reservation': _dateOfReservation
    });
  }

  void _delete() async {
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();

    await FirebaseFirestore.instance
        .collection("appointments")
        .document(x)
        .delete();
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

      FirebaseFirestore.instance
          .collection("appointments")
          .document(cardID)
          .set({
        'userId': _user.uid,
        'UserName': userDate["userName"],
        'department': _departmentName.trim(),
        'doctor': _doctorName.trim(),
        'date_Reservation': _dateOfReservation,
        'time_Reservation': _timeOfReservation,
        "created At": Timestamp.now(),
        "cardID": cardID,
      });
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  if (!(widget.changeTime))
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return "Please Enter The Department";
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText:
                              "Which department do you want make your Reservation ..?"),
                      onSaved: (value) {
                        setState(() {
                          _departmentName = value;
                        });
                      },
                    ),
                  if (!widget.changeTime)
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Please Enter The Name Of the Doctor";
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText:
                              "Which doctor do you want make your Reservation ..?"),
                      onSaved: (value) {
                        setState(() {
                          _doctorName = value;
                        });
                      },
                    ),
                  DateTimeField(
                      onSaved: (value) {
                        setState(() {
                          String formatDate = DateFormat.yMMMd().format(value);
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
                  DateTimeField(
                      //  key: _formKeyA,

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
                  SizedBox(
                    height: 12,
                  ),
                  if (_isLoading) CircularProgressIndicator(),
                  if (!_isLoading)
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(widget.changeTime ? "Change" : "Reserve"),
                      onPressed: widget.changeTime
                          ? _changeDateAndTime
                          : _submitResrvation,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
