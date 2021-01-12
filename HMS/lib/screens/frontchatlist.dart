///chatlist of Front desk
import 'package:firebase_core/firebase_core.dart';
import '../screens/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/searchbyusername.dart';
import '../screens/helpingfunctions.dart';

class FrontChatList extends StatefulWidget {
  static const String id = 'FrontChat_List';
  String listid = 'frontdesk';
  @override
  _FrontChatListState createState() => _FrontChatListState();
}

class _FrontChatListState extends State<FrontChatList> {
  String sender;
  String message1;
  User loggedinuser;
  String user1;
  String user2;
  String x;
  String chatteduser;

  void getCurrentUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        user1 = loggedinuser.email;
        print('INSIDE front CHATLIST');
        print(user1);
      }
    } catch (e) {
      print(e);
      print('nooooo');
    }
  }

  Future getdoctornames() async {
    final _firestore = FirebaseFirestore.instance;
    var doc = await _firestore.collection('frontdesk').getDocuments();
    return doc.documents;
  }

  void initState() {
    super.initState();
    getdoctornames();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xFFD6D6D6),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchByName(
                    listid: widget.listid,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
            future: getdoctornames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: FlatButton(
                        child: Text(
                          snapshot.data[index]['userName'],
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          user2 = await snapshot.data[index]['email'];
                          print('WHEN USER2 SELECTED');
                          x = await getroomid(user1, user2);
                          print('the ROOOOOM ID :');
                          print(x);

                          print('navigating...');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat(
                                roomid: x,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              }
            }),
      ),
    );
  }
}
