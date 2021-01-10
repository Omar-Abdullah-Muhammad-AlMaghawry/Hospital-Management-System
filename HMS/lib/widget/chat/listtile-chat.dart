import 'package:HMS/screens/chat_screen.dart';
import 'package:HMS/widget/chat/message-list.dart';
import 'package:flutter/material.dart';
import 'package:HMS/moduls/reciever.dart';

class ListTileOfChat extends StatelessWidget {
  //var nameOftile = '';
  var rec = Reciever();
  ListTileOfChat({@required this.rec});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(rec.id),
      title: Text(rec.name),
      onTap: () {
        MessageList.reciever = rec;
        Navigator.of(context).pushNamed(
          ChatScreen.nameRoute,
          arguments: rec,
        );
      },
    );
    ;
  }
}
