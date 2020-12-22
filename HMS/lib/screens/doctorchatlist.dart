///chatlist of doctors
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';

class DoctorChatList extends StatefulWidget {
  static const String id = 'DoctorChat_List';
  @override
  _DoctorChatListState createState() => _DoctorChatListState();
}

class _DoctorChatListState extends State<DoctorChatList> {
  User loggedinuser;
  final _auth = FirebaseAuth.instance;
  String chatteduser;
  void GetCurrentUser()async{
    try{
      final user =await FirebaseAuth.instance.currentUser;
      if(user!= null){
        loggedinuser = user;
        print(loggedinuser.email);
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


  Future getdoctornames()async{
    final _firestore = FirebaseFirestore.instance;
    var doc = await _firestore.collection('doctors').getDocuments();
    return doc.documents;
  }



  @override
  Widget build(BuildContext context) {
    void initState(){
      super.initState();
      getdoctornames();


    }

    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      appBar:AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xFFD6D6D6),
      ),
      body:
      Container(


        child:
        FutureBuilder(
            future:getdoctornames() ,
            builder:(context,snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                );
              }
              else{
                return ListView.builder(itemBuilder: (BuildContext context,int index) {

                  return ListTile(
                    title:
                    FlatButton(
                      child: Text(snapshot.data[index]['username']
                        ,style: TextStyle(fontSize: 20),
                      ),
                      onPressed: (){
                        chatteduser = snapshot.data[index]['email'];

                        // Navigator.pushNamed(context, ChatScreen.id);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(chattedusername: chatteduser,),
                          ),
                        );

                      },
                    ),
                  );
                },
                  itemCount:snapshot.data.length,
                  //scrollDirection: Axis.vertical,



                );

              }
            }

        ),

      ),



    );
  }
}

