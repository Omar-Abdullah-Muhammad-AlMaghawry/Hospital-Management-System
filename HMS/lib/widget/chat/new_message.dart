import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enterdMessage = '';
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();
    FirebaseFirestore.instance.collection("chat").add({
      "text": _enterdMessage,
      "createdAt": Timestamp.now(),
      "userId": user.uid,
      "userName": userData["userName"],
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Enter a New Messages ..."),
            onChanged: (value) {
              setState(() {
                _enterdMessage = value;
              });
            },
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _enterdMessage.trim().isEmpty ? null : _sendMessage,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
