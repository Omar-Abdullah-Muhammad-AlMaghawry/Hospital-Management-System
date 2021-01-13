import 'dart:developer';

import '../../moduls/reciever.dart';
import '../../screens/doctors/doctors_list_screen%20copy.dart';
import './doctor-list.dart';
import './doctors_dropdown_list.dart';
import './listtile-doctor.dart';
import './my_apointment.dart';
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
  static Reciever doctorRec;
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
  DateTime _dateOfReservation;
  var _timeOfReservation = '';
  TextEditingController _controller1, _controller2, _controller3, _controller4;
//  DocumentReference refrence;
  var _isLoading = false;
  var _isChange = false;
  var _isDelete = false;
  var _isClinic = true;
  var _isState = false;

  var _isChoosed = ListTileOfDoctors.isChoosed;

  UserCredential userCredential;
  final _user = FirebaseAuth.instance.currentUser;
  String x = '';
  final cardID = FirebaseFirestore.instance.collection("appointments").doc().id;
  void _changeDateAndTime() async {
    final _user = FirebaseAuth.instance.currentUser;
    FocusScope.of(context).unfocus();
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();
    _isChange = true;
    var _isValid = _formKeyA.currentState.validate();
    if (_isValid) {
      //this condition with its else is reciently added
      _formKeyA.currentState.save();
      await FirebaseFirestore.instance
          .collection("appointments")
          .document(widget.idOfCard)
          .update({
        'time_Reservation': _timeOfReservation,
        'date_Reservation': _dateOfReservation
      });
      Navigator.of(context).pop();
    } else {
      // Navigator.of(context).pop();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "You have to full up the data above",
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }

    // Firestore.instance
    //                 .runTransaction((Transaction transaction) async {
    //               CollectionReference reference =
    //               Firestore.instance.collection('appointments');
    //               await reference.
  }

  void _delete() async {
    final _user = FirebaseAuth.instance.currentUser;
    // var content =
    //     await FirebaseFirestore.instance.collection("appointments").doc().get();
    _isDelete = true;
    await FirebaseFirestore.instance
        .collection("appointments")
        .document(widget.idOfCard)
        .delete();
    Navigator.of(context).pop();
//     Firestore.instance.runTransaction((Transaction myTransaction) async {
//     await myTransaction.delete();
// });
  }

  void _submitResrvation() async {
    x = cardID;
    FocusScope.of(context).unfocus();
    //  final _user = FirebaseAuth.instance.currentUser;

    var _isValid = _formKeyA.currentState.validate();
    if (_isValid) {
      //this condition with its else is reciently added
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
        'senderPatientId': _user.uid,
        'senderPatientName': userDate["userName"],
        'department': _departmentName.trim(),
        // 'doctorOrAnlysisName': _isClinic
        //     ? "Doctor : " + _doctorOrAnlysisName.trim()
        //     : "Name : " + _doctorOrAnlysisName.trim(),
        'doctorOrAnlysisName': _isClinic
            ? "Doctor : " + DoctorsList.reciever.name
            : "Name : " + _doctorOrAnlysisName.trim(),
        'recieverDoctorId': _isClinic ? DoctorsList.reciever.id : null,
        'date_Reservation': _dateOfReservation,
        'time_Reservation': _timeOfReservation,
        "title": _isClinic ? "Clinic" : _departmentName.trim(),
        "created At": Timestamp.now(),
        "cardID": cardID,
        "diagnosis": "",
        "treatment": "",
      });
      _isLoading = false;
      // ListTileOfDoctors.isChoosed = false;
      Navigator.of(context).pop();
      _controller1.clear();
      _controller2.clear();
      _controller3.clear();
      _controller4.clear();
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "You have to full up the data above",
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }
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
                      if (_isClinic)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 50,
                          decoration: BoxDecoration(
                            // border:Border.fromBorderSide(BorderSide(color: Colors.black38)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Doctor Name :",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueAccent),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              InkWell(
                                focusColor: Colors.green,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      !_isChoosed
                                          ? "Choose The Doctor you Want to Reserve"
                                          : DoctorsList.reciever.name,
                                      style: !_isChoosed
                                          ? TextStyle(color: Colors.black54)
                                          : TextStyle(color: Colors.black),
                                    ),
                                    Icon(Icons.change_history_rounded)
                                  ],
                                ),
                                onTap: () {
                                  // _isState = !_isState;
                                  Navigator.of(context)
                                      .pushNamed(
                                    DoctorsListScreen.nameRoute,
                                  )
                                      .then((value) {
                                    setState(() {
                                      _isState = !_isState;
                                    });
                                  });

                                  //     .then((result) {
                                  //   _isChoosed = result;
                                  //   print(result);
                                  // }
                                  // );
                                },
                              ),
                            ],
                          ),
                        ),

                  if (!(widget.deleteAppoint))
                    if (!widget.changeTime)
                      if (!_isClinic)
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
                  //Container(
                  //   width: double.infinity,
                  //   height: 48,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Choose one of the following Doctor"),
                  //       DropdownButton(
                  //           iconSize: 30,
                  //           icon: Icon(Icons.arrow_drop_down),
                  //           items: [
                  //           ],
                  //           onChanged: (value) {}),
                  //     ],
                  //   ),
                  // ),

                  if (!(widget.deleteAppoint))
                    DateTimeField(
                        key: ValueKey("Date"),
                        validator: (value) {
                          if (value == null) return "please Choose The Date";
                          return null;
                        },
                        controller: _controller3,
                        onSaved: (value) {
                          setState(() {
                            _dateOfReservation = value;
                            // String formatDate =
                            //     DateFormat.yMMMd().format(value);
                            // _dateOfReservation = formatDate;
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
                            initialDate:
                                value ?? DateTime.now().add(Duration(days: 1)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        }),
                  if (!(widget.deleteAppoint))
                    DateTimeField(
                        //  initialValue: DateTime(),
                        validator: (value) {
                          if (value == null) return "please Choose The Time";
                          return null;
                        },
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
