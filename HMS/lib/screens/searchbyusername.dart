///search users by username
import 'package:firebase_core/firebase_core.dart';
import 'package:HMS/screens/chatscreen.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:HMS/screens/helpingfunctions.dart';


class SearchByName extends StatefulWidget {
  static const String id = 'Searchdoctorbyname';
   String listid;
  SearchByName({this.listid});
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  String sender;
  String message1;
  User loggedinuser;
  String user1;
  String user2;
  String x;
  String selected;
  
  final textfieldcontroller = TextEditingController();
  
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


  Future getdoctornames()async{
    final _firestore = FirebaseFirestore.instance;
    var doc = await _firestore.collection(widget.listid).where('username',isEqualTo: selected).get();
  // var doc = await _firestore.collection('doctors').where('username',whereIn: [selected,tempselected]).get();
    return doc.documents;
  }

 void initState(){
      super.initState();
      //getdoctornames();
      GetCurrentUser();

    }

  @override
  Widget build(BuildContext context) {
   

    return 
    MaterialApp(
          home: Scaffold(
        backgroundColor: Color(0xFFB3E5FC),
        appBar:AppBar(
          actions: [
             Expanded(
                        child: TextField(
                          controller: textfieldcontroller,
                          onChanged: (value){
                            setState(() {
                               selected = value;
                            }      
                            );
                             getdoctornames();

                             
                          },
                          cursorWidth: 1,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hintText: "Search by fist name...",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),

                          ),
                          style: TextStyle(
                            color:Color(0XFF424242) ,
                          ),
                        ),
                      ),
                      IconButton(icon:Icon(Icons.close),
                       onPressed: (){
                  Navigator.pop(context);
                },
                ),
          
          ],
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
                        child: Text(snapshot.data[index]['username']
                          ,style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          ),
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



      ),
    );
  }
}

