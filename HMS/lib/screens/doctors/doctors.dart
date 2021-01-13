// import '../screens/doctorlist.dart';
import 'package:HMS/screens/doctors/doctors_home_screen.dart';

import '../masterHome.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:Theme.of(context).backgroundColor,
      appBar: _getClinicsAppBar(context),
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
                                builder: (context) =>
                                    ENTDoctors('ENT Department'),
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
                                builder: (context) => DermatologyDoctors(
                                    'Dermatology Department'),
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
                              'Pediatrics Department',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PediatricsDoctors('Pediatrics Department'),
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
                                    CardiologyDoctors('Cardiology Department'),
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
                                builder: (context) => InternalMedicineDoctors(
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
                                    SurgeryDoctors('Surgery Department'),
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
                                    OrthopedicDoctors('Orthopedic Department'),
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
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
               Navigator.of(context).pop();
             
            },
          ),
          Text(
            "  Departments",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Home',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
               Navigator.popUntil(context, ModalRoute.withName(DoctorsHomeScreen.nameRoute));

            },
          )
        ],
      ),
    ),
  );
}

class InternalMedicineDoctors extends StatefulWidget {
  final Title;
  InternalMedicineDoctors(this.Title);
  @override
  _InternalMedicineDoctorsState createState() =>
      _InternalMedicineDoctorsState(Title);
}

class _InternalMedicineDoctorsState extends State<InternalMedicineDoctors> {
  @override
  final text;
  _InternalMedicineDoctorsState(this.text);
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
                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
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

class DermatologyDoctors extends StatefulWidget {
  final Title;
  DermatologyDoctors(this.Title);

  @override
  _DermatologyDoctorsState createState() => _DermatologyDoctorsState(Title);
}

class _DermatologyDoctorsState extends State<DermatologyDoctors> {
  final text;
  _DermatologyDoctorsState(this.text);
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

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
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

class SurgeryDoctors extends StatefulWidget {
  final Title;
  SurgeryDoctors(this.Title);
  @override
  _SurgeryDoctorsState createState() => _SurgeryDoctorsState(Title);
}

class _SurgeryDoctorsState extends State<SurgeryDoctors> {
  final text;
  _SurgeryDoctorsState(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
     //   backgroundColor: Colors.teal,
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

                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
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

class CardiologyDoctors extends StatefulWidget {
  final Title;
  CardiologyDoctors(this.Title);
  @override
  _CardiologyDoctorsState createState() => _CardiologyDoctorsState(Title);
}

class _CardiologyDoctorsState extends State<CardiologyDoctors> {
  final text;
  _CardiologyDoctorsState(this.text);

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
                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
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

class OrthopedicDoctors extends StatefulWidget {
  final Title;
  OrthopedicDoctors(this.Title);
  @override
  _OrthopedicDoctorsState createState() => _OrthopedicDoctorsState(Title);
}

class _OrthopedicDoctorsState extends State<OrthopedicDoctors> {
  final text;
  _OrthopedicDoctorsState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(

     //   backgroundColor: Colors.teal,
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
                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
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

class ENTDoctors extends StatefulWidget {
  final Title;
  ENTDoctors(this.Title);
  @override
  _ENTDoctorsState createState() => _ENTDoctorsState(Title);
}

class _ENTDoctorsState extends State<ENTDoctors> {
  final text;
  _ENTDoctorsState(this.text);
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
                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
                      ),
                      // SizedBox(height: 12),
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

class PediatricsDoctors extends StatefulWidget {
  final Title;
  PediatricsDoctors(this.Title);
  @override
  _PediatricsDoctorsState createState() => _PediatricsDoctorsState(Title);
}

class _PediatricsDoctorsState extends State<PediatricsDoctors> {
  final text;
  _PediatricsDoctorsState(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
     //   backgroundColor: Colors.teal,
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
                      ListTile(
                        leading: Icon(Icons.adjust_outlined),
                        title: Text(documents[index]['date2']),
                        subtitle: Text(documents[index]['time']),
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

class LabDoctors extends StatefulWidget {
  @override
  _LabDoctorsState createState() => _LabDoctorsState();
}

class _LabDoctorsState extends State<LabDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
   //     backgroundColor: Colors.red[900],
        title: Text('Lab Doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/LabSpecialist').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      //   leading: Icon(Icons.ac_unit_rounded),
                      title: Text(documents[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      subtitle: Text(documents[index]['degree'],
                          style: TextStyle(
                            fontSize: 14,
                          )),
                    ),
                    // Column(children: <Widget>[
                    //   ListTile(
                    //     leading: Icon(Icons.adjust_rounded),
                    //  //   title: Text(documents[index]['data']),
                    //   ),

                    // ]),
                    // ListTile(
                    //   leading: Icon(Icons.adjust_outlined),
                    //   title: Text(documents[index]['data2']),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RadiologyDoctors extends StatefulWidget {
  @override
  _RadiologyDoctorsState createState() => _RadiologyDoctorsState();
}

class _RadiologyDoctorsState extends State<RadiologyDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
      //  backgroundColor: Colors.red[900],
        title: Text('Radiology Doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('/RadiologySpecialist').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      //   leading: Icon(Icons.ac_unit_rounded),
                      title: Text(documents[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      subtitle: Text(documents[index]['degree'],
                          style: TextStyle(
                            fontSize: 14,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
