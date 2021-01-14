import 'package:HMS/widget/appointment/doctor-list.dart';
import 'package:HMS/widget/manager/doctor-list-manger.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widget/chat/message-list.dart';
import 'package:flutter/material.dart';

class ChooseMangerScreen extends StatefulWidget {
  static const nameRoute = '/doctors-list-screen';

  @override
  _ChooseMangerScreenState createState() => _ChooseMangerScreenState();
}

class _ChooseMangerScreenState extends State<ChooseMangerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The manager is"),
        // actions: [
        //   DropdownButton(
        //       icon: Icon(
        //         Icons.more_vert,
        //       ),
        //       items: [
        //         DropdownMenuItem(
        //           child: Container(
        //             child: Row(
        //               children: [
        //                 Icon(Icons.logout),
        //                 SizedBox(
        //                   width: 8,
        //                 ),
        //                 Text("Logout"),
        //               ],
        //             ),
        //           ),
        //           value: 'logout',
        //         ),
        //       ],
        //       onChanged: (value) {
        //         if (value == 'logout') FirebaseAuth.instance.signOut();
        //       })
        // ],
      ),
      body: DoctorsListForManger(),
      
    );
  }
}
