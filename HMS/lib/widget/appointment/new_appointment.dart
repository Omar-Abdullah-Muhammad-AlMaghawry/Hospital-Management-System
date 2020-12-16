import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewAppointment extends StatefulWidget {
  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  var _departmentName = '';
  var _doctorName = '';
  var _createdAt = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText:
                              "Which department do you want make your Reservation ..?"),
                      onChanged: (value) {
                        _departmentName = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText:
                              "Which department do you want make your Reservation ..?"),
                      onChanged: (value) {
                        _departmentName = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText:
                              "Which doctor do you want make your Reservation ..?"),
                      onChanged: (value) {
                        _doctorName = value;
                      },
                    ),
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
