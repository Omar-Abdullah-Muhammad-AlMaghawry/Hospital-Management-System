///chatlist of doctors
import 'package:firebase_core/firebase_core.dart';
import './chatscreen.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import './searchbyusername.dart';
import './helpingfunctions.dart';

class PatientChatList extends StatefulWidget {
  static const String id = 'PatientChat_List';
   String listid = 'patients';
  @override
  _PatientChatListState createState() => _PatientChatListState();
}

class _PatientChatListState extends State<PatientChatList> {
  String sender;
  String message1;
  User loggedinuser;
  String user1;
  String user2;
  String x;
  String chatteduser;

  void GetCurrentUser()async{
    try{
      final user =await FirebaseAuth.instance.currentUser;
      if(user!= null){
        loggedinuser = user;
        user1 = loggedinuser.email;
        print('INSIDE DOCTOR CHATLIST');
        print(user1);
      }
    }
    catch(e){
      print(e);
      print('nooooo');
    }
    
  }


  Future getpatientnames()async{
    final _firestore = FirebaseFirestore.instance;
    var doc = await _firestore.collection('patients').getDocuments();
    return doc.documents;
  }

 void initState(){
      super.initState();
      getpatientnames();
      GetCurrentUser();

    }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
    //  backgroundColor: Color(0xFFB3E5FC),
           backgroundColor: Theme.of(context).backgroundColor,
      appBar:AppBar(
        title: Text('Chat'),
       // backgroundColor: Color(0xFFD6D6D6),
        actions: [
          IconButton(

          icon:Icon(Icons.search),
          onPressed: (){
           // Navigator.pushNamed(context,SearchByName.id);
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>SearchByName(listid: widget.listid,),
                          ),
                        );

          },
        ),],
      ),
      body:
      Container(


        child:
        FutureBuilder(
            future:getpatientnames() ,
            builder:(context,snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                );
              }
              else{
                return ListView.builder(itemBuilder: (BuildContext context,int index) {

                  return ListTile(
                    title:
                    FlatButton(
                      child: Text(snapshot.data[index]['userName']
                        ,style: TextStyle(fontSize: 20),
                      ),
                      onPressed: ()async{

                        user2 = await snapshot.data[index]['email'];
                        print('WHEN USER2 SELECTED');

                           x= await getroomid(user1,user2);                                                  
                        print('the ROOOOOM ID :');
                        print(x);

      
         print('navigating...');
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(roomid: x,),
                          ),
                        );

                      },
                    ),
                  );
                },
                  itemCount:snapshot.data.length,

                );

              }
            }

        ),

      ),



    );
  }
}

