import 'package:HMS/moduls/reciever.dart';
import 'package:HMS/screens/chat_screen.dart';
import 'package:HMS/widget/appointment/listtile-doctor.dart';
import 'package:HMS/widget/chat/listtile-chat.dart';
import 'package:HMS/widget/chat/messages.dart';
import 'package:HMS/widget/chat/new_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatefulWidget {
  static Reciever reciever;

  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  String id;
  String userName;
  Reciever rec;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (ctx, snapshots) {
          var nameMember = snapshots.data.documents??0;
          // if (nameMember == ConnectionState.waiting) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          return ListView.builder(
            itemCount: nameMember.length??0,
            itemBuilder: (ctx, index) {
              id = nameMember[index].id??0;
              userName = nameMember[index]["userName"]??0;
              
              // Messages(
              //   id: id,
              // );
              // ChatScreen(
              //   userName: userName,
              // );
              return ListTileOfDoctors(rec: Reciever(id: id,name: userName));
              // ListTile(

              //   key: Key(id),
              //   title: Text(nameMember[index]["userName"]),
              //   onTap: () {
              //     rec = Reciever(id: id, name: userName);
              //     MessageList.reciever = rec;
              //     Navigator.of(context).pushNamed(
              //       ChatScreen.nameRoute,
              //       arguments: rec,
              //     );
              //   },
              // );
            },
          );
        });
  }
}
