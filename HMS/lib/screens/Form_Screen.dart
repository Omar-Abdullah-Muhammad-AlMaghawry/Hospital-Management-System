import 'package:HMS/screens/doctors_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  var selectedDepart, selectedType, selectedDay1, selectedDay2, selectedtime;
  String _degree;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          fontSize: 18,
        ),
      ),

      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildDegree() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Your Degree',
        labelStyle: TextStyle(
          fontSize: 18,
        ),
      ),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Degree is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _degree = value;
        Firestore.instance
            .collection(' $selectedDepart')
            .document('2')
            .setData({
          'degree': _degree,
          'name': _name,
          'depart': selectedDepart,
          'date1': selectedDay1,
          'date2': selectedDay2,
          'time': selectedtime,
          //TODO send  doctor id
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Doctor Details"),
       // backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildDegree(),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Select your department:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("/docdepartment")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> departmentItems = [];
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          DocumentSnapshot snap = snapshot.data.documents[i];
                          departmentItems.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.documentID,
                                style: TextStyle(color: Colors.teal),
                              ),
                              value: "${snap.documentID}",
                            ),
                          );
                        }
                        return Row(
                          children: <Widget>[
                            DropdownButton(
                              items: departmentItems,
                              onChanged: (departValue) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'The Department is $departValue',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedDepart = departValue;
                                });
                              },
                              value: selectedDepart,
                              isExpanded: false,
                              hint: new Text(
                                "Choose Your Department ",
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ],
                        );
                      }
                    }),

                //////////
                ///
                Container(
                  alignment: Alignment.bottomLeft,
                  // height: 15,
                  child: Text(
                    'Select your First Date:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("/DateDoctors")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> date1Items = [];
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          DocumentSnapshot snap = snapshot.data.documents[i];
                          date1Items.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.documentID,
                                style: TextStyle(color: Colors.teal),
                              ),
                              value: "${snap.documentID}",
                            ),
                          );
                        }
                        return Row(
                          children: <Widget>[
                            DropdownButton(
                              items: date1Items,
                              onChanged: (day1Value) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'The First Day is $day1Value',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedDay1 = day1Value;
                                });
                              },
                              value: selectedDay1,
                              isExpanded: false,
                              hint: new Text(
                                " Your First Day ",
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                /////
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Select your Second Day:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("/DateDoctors2")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> date2Items = [];
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          DocumentSnapshot snap = snapshot.data.documents[i];
                          date2Items.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.documentID,
                                style: TextStyle(color: Colors.teal),
                              ),
                              value: "${snap.documentID}",
                            ),
                          );
                        }
                        return Row(
                          children: <Widget>[
                            DropdownButton(
                              items: date2Items,
                              onChanged: (day2Value) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'The Second Date is $day2Value',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedDay2 = day2Value;
                                });
                              },
                              value: selectedDay2,
                              isExpanded: false,
                              hint: new Text(
                                " Your Second Day: ",
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
//////
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Select your Clinic Time:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("/ClinicsTime")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> timeItems = [];
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          DocumentSnapshot snap = snapshot.data.documents[i];
                          timeItems.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.documentID,
                                style: TextStyle(color: Colors.teal),
                              ),
                              value: "${snap.documentID}",
                            ),
                          );
                        }
                        return Row(
                          children: <Widget>[
                            DropdownButton(
                              items: timeItems,
                              onChanged: (timeValue) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'The Clinic Time is $timeValue',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedtime = timeValue;
                                });
                              },
                              value: selectedtime,
                              isExpanded: false,
                              hint: new Text(
                                "Your Clinic Time ",
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                /////////&&&&&

                ///
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.teal, fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      return Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DoctorsHomeScreen() ?? Center()));
                    }

                    _formKey.currentState.save();

                    print(_name);

                    print(_degree);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
