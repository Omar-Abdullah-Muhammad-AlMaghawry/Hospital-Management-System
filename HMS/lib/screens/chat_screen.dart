import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flash_chat/screens/testimage.dart';



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
  User loggedinuser;
  final _auth = FirebaseAuth.instance;
  ////////////////
  String user1;
  String user2;
  String temp1;
  String temp2;
  String temp3;
  Stream chatmessagesstream;
  ///get the image
  File _image;
  /* Future getimage()async{
     await ImagePicker().getImage(source: ImageSource.camera).then((value) {
      _image =  File(value.path);
    });


  }

  */
  void _pickimage()async{
    await ImagePicker.pickImage(source: ImageSource.camera).then((value) {
      _image =  value;
    });
  }
  ///shit everywhere
  /* Future QuerySnapshot getinitialdata(String temp33)async{
    QuerySnapshot querySnapshot = await Firestore.instance.collection('chatrooms/$temp33/messages').getDocuments();
    var list = querySnapshot.documents,
  }
*/
  Future getroomid()async{
    temp1 = user1 + "-" + user2;
    temp2 = user2 + "-" + user1;
    var chatroomid1 =await Firestore.instance.collection('chatrooms/$temp1/messages').getDocuments().then((value) {
      if(value.docs.length>0){
        temp3 = temp1;
        print('temp1exist');
        ///print collectoin here
      }
      else{
        temp3=temp2;
        print('temp1existNOEXISTANCE');
      }

    });

    Firestore.instance.collection('chatrooms/$temp3/messages/temp').add({
      'text':'',
      'sender':loggedinuser.email,
      'createdat':Timestamp.now(),
    });

    // var chatroomid2 =await Firestore.instance.collection('chatrooms').doc('$user2-$user1').get();

  }

  void GetCurrentUser()async{
    try{
      final user =await FirebaseAuth.instance.currentUser;
      if(user!= null){
        loggedinuser = user;
        print(loggedinuser.email);
        user1 = loggedinuser.email;
        ///check that i got the chatted user name correctly ;)
        print(widget.chattedusername);
      }
    }
    catch(e){
      print(e);
      print('nooooo');
    }
    getroomid();
  }

  void initState(){
    super.initState();
    user2 = widget.chattedusername;
    GetCurrentUser();

    //  Firestore.instance.collection('chatrooms/$temp3/messages').doc('temp').delete();
    /* Firestore.instance.collection('chatrooms/$temp3/messages').get().then((value) => (){
       value.docs.forEach((element) {
          return Text(element['text']);
       });
    });
*/
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
                Container(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: _image!=null?Colors.black:Colors.white60,

                    backgroundImage:_image!=null?FileImage(_image):null,

                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFF035F6D),
                    child:

                    StreamBuilder<QuerySnapshot>(
                      ///here i am gonna pass two vars of both logged in&chatted usernames
                      stream: FirebaseFirestore.instance.collection('chatrooms/$temp3/messages').orderBy('createdat',descending: true).snapshots(),
                      //initialData:

                      builder:(context,snapshot) {
                        if(snapshot.hasData){
                          final messages = snapshot.data.documents;
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
                            setState(() {
                              message1 = value;
                            });

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

                      //////////////////////////added for the photo upload
                      IconButton(
                        icon: Icon(Icons.perm_media_outlined),
                        highlightColor: Colors.grey,
                        disabledColor: Colors.white10,
                        color: Color(0xFF8F0026),
                        onPressed:
                            ()async{
                          //Upload the photo
                          //a pointer to the path of the uploaded image
                          _pickimage();


                          //ref is a pointer to the main bucket
                          final refpath =  FirebaseStorage.instance.ref().child('imagemessages').child(user1 + '.jpg');
                          await refpath.putFile(_image);
                          final url = await refpath.getDownloadURL();
                          ///make the keyboard disappear after pressing the send button
                          FocusScope.of(context).unfocus();
                          /////////store image url in messages collection of this chatroom
                          FirebaseFirestore.instance.collection('chatrooms/$temp3/messages').add({
                            'text': 'image',
                            'sender':loggedinuser.email,
                            'createdat':Timestamp.now(),
                            'imageurl':url,
                          });
                        },

                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        highlightColor: Colors.grey,
                        disabledColor: Colors.white10,

                        color: Color(0xFF8F0026),
                        onPressed:
                            (){
                          setState(() {

                            //check if the chatroom already exists
                            print('TEMP33333333333');
                            print(temp3);
                            /////////////////////////////////////////////
                            //store data in firestore database
                            //message1 in text field in messages collection & loggedinuser.email in sender field

                            FirebaseFirestore.instance.collection('chatrooms/$temp3/messages').add({
                              'text': message1,
                              'sender':loggedinuser.email,
                              'createdat':Timestamp.now(),
                            });
                            FirebaseFirestore.instance.collection('chatrooms/$temp3/messages').doc('temp').delete();
                            ///delete message from textfield
                            textfieldcontroller.clear();
                            ///make the keyboard disappear after pressing the send button
                            FocusScope.of(context).unfocus();

                          });

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

