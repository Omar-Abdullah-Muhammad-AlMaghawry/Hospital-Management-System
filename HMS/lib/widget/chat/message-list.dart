import '../../moduls/reciever.dart';
import '../../screens/chat/chat0_screen.dart';
import '../../widget/chat/listtile-chat.dart';
import 'package:HMS/widget/chat/messages.dart';
import 'package:HMS/widget/chat/new_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  static Reciever reciever;

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  String id;
  String userName;
  Reciever rec;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (ctx, snapshots) {
          var nameMember = snapshots.data.documents;
          // if (nameMember == ConnectionState.waiting) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          return ListView.builder(
            itemCount: nameMember.length,
            itemBuilder: (ctx, index) {
              id = nameMember[index].id;
              userName = nameMember[index]["userName"];
              // Messages(
              //   id: id,
              // );
              // ChatScreen(
              //   userName: userName,
              // );
              return ListTileOfChat(rec: Reciever(id: id,name: userName));
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
