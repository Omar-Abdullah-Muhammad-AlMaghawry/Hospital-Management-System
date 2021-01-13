import 'package:HMS/screens/patient/patients_home_screen.dart';

import '../masterHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import '../outpatientclinics.dart';

class Departments extends StatefulWidget {
  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "OutPatient Clinics",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        //  backgroundColor: Colors.teal,
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Home',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(PatientHomeScreen.nameRoute));
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'ENT Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ENT('ENT Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'Dermatology Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Dermatology('Dermatology Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        focusColor: Colors.teal,
                        // leading: CircleAvatar(
                        //   backgroundColor: Colors.red,
                        // ),
                        leading: FlatButton(
                            child: Text(
                              'Pediatrics Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Pediatrics('Pediatrics Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'Cardiology Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Cardiology('Cardiology Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'InternalMedicine Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InternalMedicine(
                                    'InternalMedicine Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'Surgery Department',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Surgery('Surgery Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 15.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: FlatButton(
                            child: Text(
                              'Orthopedic Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Orthopedic('Orthopedic Department'),
                              ));
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_getClinicsAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      alignment: Alignment.bottomCenter,
      color: Colors.teal[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.menu),
          //   color: Colors.white,
          //   onPressed: () {
          //     // Navigator.of(context).pop();
          //     // Navigator.of(context).pop();

          //     FirebaseAuth.instance.signOut();
          //      Navigator.popUntil(context, ModalRoute.withName(MasterHome.nameRoute));

          //   },
          // ),
          Text(
            "OutPatient Clinics",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text('Log out',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pop();
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(
                  context, ModalRoute.withName(MasterHome.nameRoute));
            },
          ),
        ],
      ),
    ),
  );
}

class InternalMedicine extends StatefulWidget {
  final Title;
  InternalMedicine(this.Title);
  @override
  _InternalMedicineState createState() => _InternalMedicineState(Title);
}

class _InternalMedicineState extends State<InternalMedicine> {
  final _user = FirebaseAuth.instance.currentUser;
  final text;
  _InternalMedicineState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //   backgroundColor: Colors.teal,
        title: Text(text),
        // leading: IconButton(
        //   icon: Icon(Icons.logout),
        //   color: Colors.white,
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //     Navigator.of(context).pop();
        //     Navigator.of(context).pop();
        //     FirebaseAuth.instance.signOut();
        //   },
        // ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/InternalMedicine').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            // 'time': ,

                            // 'date': documents[index]['date1'],

                            //         'senderPatientId': _user.uid,
                            // 'senderPatientName': documents["userName"],
                            // 'department':  documents[index]['depart'],
                            // // 'doctorOrAnlysisName': _isClinic
                            // //     ? "Doctor : " + _doctorOrAnlysisName.trim()
                            // //     : "Name : " + _doctorOrAnlysisName.trim(),
                            // 'doctorOrAnlysisName': documents[index]['name'],

                            // 'recieverDoctorId': _isClinic ? DoctorsList.reciever.id : null,
                            // 'date_Reservation': _dateOfReservation,
                            // 'time_Reservation': _timeOfReservation,
                            // "title": _isClinic ? "Clinic" : _departmentName.trim(),
                            // "created At": Timestamp.now(),
                            // "cardID": cardID,

                            //TODO return doctorid
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Dermatology extends StatefulWidget {
  final title;
  Dermatology(this.title);
  @override
  _DermatologyState createState() => _DermatologyState(title);
}

class _DermatologyState extends State<Dermatology> {
  final text;
  _DermatologyState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //  backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Dermatology').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            'time': documents[index]['time'],
                            'doctor': documents[index]['name'],
                            'date': documents[index]['date1'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Surgery extends StatefulWidget {
  final Title;
  Surgery(this.Title);
  @override
  _SurgeryState createState() => _SurgeryState(Title);
}

class _SurgeryState extends State<Surgery> {
  final text;
  _SurgeryState(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Surgery').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            'time': documents[index]['time'],
                            'doctor': documents[index]['name'],
                            'date': documents[index]['date1'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Cardiology extends StatefulWidget {
  final Title;
  Cardiology(this.Title);

  @override
  _CardiologyState createState() => _CardiologyState(Title);
}

class _CardiologyState extends State<Cardiology> {
  final text;
  _CardiologyState(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //     backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Cardiology').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            'time': documents[index]['time'],
                            'doctor': documents[index]['name'],
                            'date': documents[index]['date1'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Orthopedic extends StatefulWidget {
  final title;
  Orthopedic(this.title);
  @override
  _OrthopedicState createState() => _OrthopedicState(title);
}

class _OrthopedicState extends State<Orthopedic> {
  final text;
  _OrthopedicState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //      backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Orthopedic').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            'time': documents[index]['time'],
                            'doctor': documents[index]['name'],
                            'date': documents[index]['date1'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ENT extends StatefulWidget {
  final title;
  ENT(this.title);
  @override
  _ENTState createState() => _ENTState(title);
}

class _ENTState extends State<ENT> {
  final text;
  _ENTState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //     backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/ENT').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
////
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),

                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            "date1": {
                              'time': documents[index]['time'],
                              'doctor': documents[index]['name'],
                              'date': documents[index]['date1'],
                              'depart': documents[index]['depart'],
                            },
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Pediatrics extends StatefulWidget {
  final Title;
  Pediatrics(this.Title);
  @override
  _PediatricsState createState() => _PediatricsState(Title);
}

class _PediatricsState extends State<Pediatrics> {
  final text;
  _PediatricsState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        //      backgroundColor: Colors.teal,
        title: Text(text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/Pediatrics').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        //  leading: Icon(Icons.ac_unit_rounded),
                        title: Text(documents[index]['name']),
                        subtitle: Text(documents[index]['degree']),
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_rounded),
                        title: Text(documents[index]['date1']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        color: Colors.teal,
                        child: Text('Book'),
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('1')
                              .setData({
                            'time': documents[index]['time'],
                            'doctor': documents[index]['name'],
                            'date': documents[index]['date1'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Book'),
                        color: Colors.teal,
                        onPressed: () {
                          Firestore.instance
                              .collection('/appoiment')
                              .document('2') //user id
                              .setData({
                            'date2': documents[index]['date2'],
                            'doctor': documents[index]['name'],
                            'time': documents[index]['time'],
                            'depart': documents[index]['depart'],
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
