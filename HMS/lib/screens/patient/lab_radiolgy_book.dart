
import 'package:HMS/screens/patient/fawry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  final name;
  final price;
  final userID;
  Date(this.name, this.price, this.userID);

  @override
  _DateState createState() => _DateState(name, price, userID);
}

class _DateState extends State<Date> {
  final test, cost, id;
  _DateState(this.test, this.cost, this.id);
  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-mm-dd hh:mm');
  // DateTime get selectedDate => null;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(' booking'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          alignment: AlignmentDirectional.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Text(test),
              Text(cost),
              Text(id),
              Text(dateFormat.format(selectedDate)),
              RaisedButton(
                child: Text('choose'),
                onPressed: () async {
                  final selectedDate = await _selectDateTime(context);
                  if (selectedDate == null) return 'choose the date';
                  print(selectedDate);
                  final selectedTime = await _selectTime(context);
                  if (selectedTime == null) return 'choose the time';
                  print(selectedTime);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>RandomGen() , //confirm page
                  ));

                  Firestore.instance
                      .collection('/LabReservation')
                      .document('1') //user id
                      .setData({
                    'price': cost,
                    'name': test,
                    'department': 'Analysis'
                    //  'date':selectedDate,
                    //userid
                  });
                },
              ),
            ],
          ),
        ),
      );
  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  );
}