import 'package:HMS/widget/manager/doctor-list-manger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screens/chat/chat0_screen.dart';
import '../../screens/patient/my_appointment_screen.dart';
import 'package:HMS/widget/appointment/doctor-list.dart';
import 'package:HMS/widget/chat/message-list.dart';
import 'package:flutter/material.dart';
import 'package:HMS/moduls/reciever.dart';

class ListTileOfDoctorsForManger extends StatelessWidget {
  static var isChoosedMan = false;
  //var nameOftile = '';
  var rec = Reciever();
  // static var rerc=Reciever();
  ListTileOfDoctorsForManger({@required this.rec});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(rec.id),
      title: Text(rec.name),
      onTap: () async {
        ListTileOfDoctorsForManger.isChoosedMan = true;
        DoctorsListForManger.recieverManger = rec;
        await FirebaseFirestore.instance
            .collection("doctors")
            .doc(rec.id)
            .update(
          {
            "isManger": true,
          },
        );
        Navigator.of(context).pop();
        return SnackBar(
          content: Text("You Choose the Manger ${rec.id}"),
        );
      },
    );
  }
}
