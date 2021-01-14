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
// //runApp(ServiceFees());
// //}

// class ServiceFees extends StatefulWidget {
//   @override
//   _ServiceFees createState() => _ServiceFees();
// }

// class _ServiceFees extends State<ServiceFees> {
//   //var scroll = ScrollDragController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
   
      
//       backgroundColor:  Theme.of(context).backgroundColor,
//         appBar: AppBar(
//           title: Text(
//             'Service Fees ',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//       //    backgroundColor: Color(0xFD6D6D6),
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

//                   return DataTable(
//                     columns: <DataColumn>[
//                       DataColumn(
//                         label: Text(
//                           'Name',
//                           style: TextStyle(
//                             fontSize: 5,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFE1F5FE),
//                           ),
//                         ),
//                         numeric: false,
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Salary',
//                           style: TextStyle(
//                             fontSize: 5,
//                             color: Color(0xFFE1F5FE),
//                           ),
//                         ),
//                         numeric: false,
//                       ),
//                     ],
//                     rows: <DataRow>[
//                       DataRow(
//                         cells: <DataCell>[
//                           DataCell(
//                             Text(
//                               'Dr ' + doc[index]['userName'],
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),

//                           DataCell(
//                             Text(
//                               doc[index]["fees"] + '  LE',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           // DataCell(Text( document['salary'] ,),
//                         ],
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
