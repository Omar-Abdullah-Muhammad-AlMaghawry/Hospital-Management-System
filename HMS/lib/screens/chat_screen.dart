import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';

String cuser;

class ChatScreen extends StatefulWidget {
  String chattedusername;
  ChatScreen({this.chattedusername});


  static const id = 'Chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final textfieldcontroller = TextEditingController();
  String sender;
  String message1;
  final _firestore = FirebaseFirestore.instance;
  User loggedinuser;
  final _auth = FirebaseAuth.instance;
  ////////////////
  String user1;
  String user2;


  void GetCurrentUser()async{
    try{
      final user =await FirebaseAuth.instance.currentUser;
      if(user!= null){
        loggedinuser = user;
        print(loggedinuser.email);
        user1 = loggedinuser.email;
        user2 = widget.chattedusername;
        ///check that i got the chatted user name correctly ;)
        print(widget.chattedusername);
      }
    }
    catch(e){
      print(e);
      print('nooooo');
    }
  }

  void initState(){
    super.initState();
    GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFF035F6D),
          appBar:AppBar(
            backgroundColor: Color(0xFF8F0026),
            title: Text('⚡️Chat'),
            actions: [
              IconButton(
                icon:Icon(Icons.close,
                  // color: Color( 0xFF0099FF),
                  color: Colors.white,
                ),
                onPressed: (){
                  //_auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),

          body:
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Color(0xFF035F6D),
                    child:

                    StreamBuilder<QuerySnapshot>(
                      ///here i am gonna pass two vars of both logged in&chatted usernames instead of merna-mariam
                      stream: _firestore.collection('chatrooms/$user1-$user2/messages').orderBy('createdat',descending: true).snapshots(),
                      builder:(context,snapshot) {
                        if(snapshot.hasData){
                          final messages = snapshot.data.documents.reversed;
                          List<Bubble>messagewidgets=[];
                          for(var message in messages){

                            var messagetext = message.data()['text'];

                            final messagesender = message.data()['sender'];

                            final  messagewidget =Bubble(sender: messagesender,text: messagetext,isloggeduser: (messagesender==loggedinuser)?true:false);
                            messagewidgets.add(messagewidget);
                          }
                          return
                            Expanded(
                              child: ListView(
                                reverse: true,
                                children: messagewidgets,
                              ),
                            );
                        }
                      },
                    ),

                  ),
                ),
                Material(
                  color: Colors.white,
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                ////added now at 22/12/2020


                Material(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                      Expanded(
                        child: TextField(
                          controller: textfieldcontroller,
                          onChanged: (value){
                            message1 = value;
                          },
                          cursorWidth: 1,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hintText: "type message here...",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),

                          ),
                          style: TextStyle(
                            color:Color(0xFF8F0026) ,
                          ),


                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        highlightColor: Colors.grey,
                        disabledColor: Colors.white10,

                        color: Color(0xFF8F0026),
                        onPressed:
                            (){
                          //store data in firestore database
                          //message1 in text field in messages collection & loggedinuser.email in sender field
                          _firestore.collection('chatrooms/$user1-$user2/messages').add({
                            'text': message1,
                            'sender':loggedinuser.email,
                            'createdat':Timestamp.now(),
                          });
                          ///delete message from textfield
                          textfieldcontroller.clear();
                          ///make the keyboard disappear after pressing the send button
                          FocusScope.of(context).unfocus();
                        },

                      ),

                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      );
  }
}
class Bubble extends StatelessWidget {
  Bubble({this.text,this.sender,this.isloggeduser});
  final bool isloggeduser;
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isloggeduser?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender),
          Material(
            borderRadius:isloggeduser?
            BorderRadius.only(topLeft:Radius.circular(15) ,bottomLeft:Radius.circular(15) ,bottomRight: Radius.circular(0),topRight: Radius.circular(15))
                : BorderRadius.only(topLeft:Radius.circular(15) ,bottomLeft:Radius.circular(0) ,bottomRight: Radius.circular(15),topRight: Radius.circular(15)),
            color:  isloggeduser?Colors.white:Color(0xFF8F0026),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 7, 10, 10),
              child: Text(
                text ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    )
    ;

  }
}
