import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
/*
void main() {
  runApp(Homepage ());
}
*/

//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp();
// runApp(AccessData());
//}

class AccessData extends StatefulWidget {
  @override
  _AccessData createState() => _AccessData();
}

class _AccessData extends State<AccessData> {
  //var scroll = ScrollDragController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(
          title: Text(
            'Access Data',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFD6D6D6),
        ),
        //  Firebase val = Firebase.instance();

        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("doctors ").snapshots(),
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

                  return ExpansionTile(
                    title: Text('Dr ' + doc[index]['name']),
                    children: <Widget>[
                      Text(
                        'Phone Number : ' + doc[index]['phone  number'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'E_mail : ' + doc[index]['email'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Address :  ' + doc[index]['Adress'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Department :  ' + doc[index]['department'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Salary :  ' + doc[index]["fees"] + '  LE',
                        style: TextStyle(fontSize: 15),
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
