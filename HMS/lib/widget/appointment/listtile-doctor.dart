import 'package:HMS/screens/chat_screen.dart';
import 'package:HMS/screens/my_appointment_screen.dart';
import 'package:HMS/widget/appointment/doctor-list.dart';
import 'package:HMS/widget/chat/message-list.dart';
import 'package:flutter/material.dart';
import 'package:HMS/moduls/reciever.dart';

class ListTileOfDoctors extends StatelessWidget {
  static var isChoosed = false;
  //var nameOftile = '';
  var rec = Reciever();
  // static var rerc=Reciever();
  ListTileOfDoctors({@required this.rec});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(rec.id),
      title: Text(rec.name),
      onTap: () {
        ListTileOfDoctors.isChoosed = true;
        DoctorsList.reciever = rec;
        Navigator.of(context).pop();
        
      },
    );
  }
}
