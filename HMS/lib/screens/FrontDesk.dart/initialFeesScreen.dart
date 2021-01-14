import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ServiceFees extends StatefulWidget {
  @override
  _ServiceFees createState() => _ServiceFees();
}

class _ServiceFees extends State<ServiceFees> {
  String x;
  //var scroll = ScrollDragController();
  // final doc = snapshot.data.documents;
  String result = "";
  //result =snapshot.data.documents;
  String result1 = "";
  TextEditingController conroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //   backgroundColor: Color(0xFFE1F5FE),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text('Home',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          title: Text(
            'Service Fees ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          //   backgroundColor: Color(0xFD6D6D6),
        ),
        //  Firebase val = Firebase.instance();

        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("doctors").snapshots(),
            builder: (context, snapshot) {
              final doc = snapshot.data.documents;
              if (snapshot.hasData == null) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  //children : snapshot.data.documents.map((  document ) {
                  // doc =

                  return Column(
                    children: [
                      DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                //    color: Color(0xFFE1F5FE),
                              ),
                            ),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text(
                              'Salary',
                              style: TextStyle(
                                fontSize: 20,
                                //  color: Color(0xFFE1F5FE),
                              ),
                            ),
                            numeric: false,
                          ),
                        ],
                        rows: <DataRow>[
                          //children: [],
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                  'Dr ' +
                                      snapshot.data.documents[index]
                                          ['userName'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              DataCell(
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: " Update Salay",
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                  ),
                                  onSubmitted: (String str) {
                                    setState(() {
                                      result = str;
                                      print(result);
                                      // conroller.text= "result";
                                    });

                                    x = snapshot.data.docs[index].id;
                                    Firestore.instance
                                        .collection('doctors')
                                        .doc(x)
                                        .update({'salary': result});

                                    conroller.text = "result";
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 0, 50, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Salary :',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              snapshot.data.docs[index]['salary'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
