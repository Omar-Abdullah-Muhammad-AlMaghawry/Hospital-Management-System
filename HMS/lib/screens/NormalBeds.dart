import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NormalBeds extends StatefulWidget {
  @override
  _NormalBedsState createState() => _NormalBedsState();
}

class _NormalBedsState extends State<NormalBeds> {
  final _formKey = GlobalKey<FormState>();
  String patientName = '';
  //String password = '';
  String error = '';
  String _date = (DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
        // backgroundColor: Colors.teal[500],
        appBar: AppBar(
         // backgroundColor: Colors.teal[700],
          elevation: 0.0,
          title: Text('Normal beds reservation form'),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              label: Text(
                '',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //widget.toggleView();
              },
            )
          ],
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 150.0),
                    TextFormField(
                      decoration: inputTextDecoration.copyWith(
                          hintText: 'Patient name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter patient\'s name' : null,
                      onChanged: (val) {
                        setState(() {
                          patientName = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.blueAccent)),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(1940, 1, 1),
                            maxTime: DateTime.now(), onConfirm: (date) {
                          print('confirm $date');
                          _date = '${date.month} / ${date.day} / ${date.year}';
                          //_date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        " $_date",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Reserve date ",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Reserve ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            )));
  }
}
