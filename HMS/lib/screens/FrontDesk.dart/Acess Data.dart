// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// /*
// void main() {
//   runApp(Homepage ());
// }
// */

// //void main() async {
// //WidgetsFlutterBinding.ensureInitialized();
// //await Firebase.initializeApp();
// // runApp(AccessData());
// //}

// class AccessData extends StatefulWidget {
//   @override
//   _AccessData createState() => _AccessData();
// }

// class _AccessData extends State<AccessData> {
//   //var scroll = ScrollDragController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xFFE1F5FE),
//         appBar: AppBar(
//           title: Text(
//             'Access Data',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Color(0xFD6D6D6),
//         ),
//         //  Firebase val = Firebase.instance();

//         body: StreamBuilder<QuerySnapshot>(
//             stream: Firestore.instance.collection("doctors").snapshots(),
//             builder: (context, snapshot) {
//               final doc = snapshot.data.documents;
//               // if (snapshot.hasData == null) {
//               //   return Center(child: CircularProgressIndicator());
//               // }

//               // if (snapshot.data == null) {
//               //   return Center(child: CircularProgressIndicator());
//               // }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }

//               return ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (context, index) {
//                   //children : snapshot.data.documents.map((  document ) {
//                   // doc =

//                   return ExpansionTile(
//                     title: Text('Dr ' + doc[index]['userName']),
//                     children: <Widget>[
//                       Text(
//                         'Phone Number: ' + doc[index]['phoneNumber'],
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       Text(
//                         'E_mail: ' + doc[index]['email'],
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       Text(
//                         'Address:  ' + doc[index]['address'],
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       Text(
//                         'Birth date:  ' + doc[index]['birthDate'],
//                         style: TextStyle(fontSize: 15),
//                       ),
//                       Text(
//                         'Salary:  ' + doc[index]["fees"] + '  LE',
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
/*
void main() {
  runApp(Homepage ());
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AccessData());
}

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
        backgroundColor: Theme.of(context).backgroundColor,
        // backgroundColor: Color(0xFFE1F5FE),
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
            'Access Data',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          //     backgroundColor: Color(0xFD6D6D6),
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
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return CircularProgressIndicator();
              // }

              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  //children : snapshot.data.documents.map((  document ) {
                  // doc =

                  return ExpansionTile(
                    title: Text('Dr ' + doc[index]['userName']),
                    children: <Widget>[
                      Text(
                        'Phone Number : ' + doc[index]['phoneNumber'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'E_mail : ' + doc[index]['email'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Address :  ' + doc[index]['address'],
                        style: TextStyle(fontSize: 15),
                      ),
                      /*
                      Text(  'Department :  ' + doc[index]['department']
                        , style: TextStyle(fontSize: 15),
                      ),
                      */

                      Text(
                        'Salary :  ' + doc[index]["salary"] + '  LE',
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
