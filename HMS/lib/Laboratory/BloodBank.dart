import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'dart:core';

class Bloodbank extends StatefulWidget {
 
 // List<int> aplus = List<int>(8);
 int aplus;int aneg;int bneg;int bplus; int oplus;int oneg; int abplus; int abneg;

  Bloodbank({this.aplus,this.aneg,this.bplus,this.bneg,this.oplus,this.oneg,this.abplus,this.abneg});
  @override
  _BloodbankState createState() => _BloodbankState();
}
 class _BloodbankState extends State<Bloodbank> {
   int A_plus=0;
   
   int A_neg=0;
   int B_plus=0 ;
   int B_neg=0;
   int AB_neg=0 ;
   int AB_plus=0;
   int O_plus=0;
   int O_neg=0;
   String temp;
   int v;
   Map x;
 
Future getnumofbloodbags()async{
     await Firestore.instance.collection('bloodBank').doc('Aplus').get().then((value) {
     
      x = value.data();
      
   } );
}

   int  Blood( int num , int blood_type  ) {

   if (num == 1) {
     setState(() {
       blood_type ++;
     });
   }
   if (num != 1) {
     setState(() {
       blood_type --;
       if(blood_type <= 0 )
         { blood_type = 0 ; }
     });
   }
return blood_type ;
 }

 void initState(){
      super.initState();
  // getnumofbloodbags();
  A_plus =  widget.aplus;
  B_plus =  widget.bplus;
  AB_plus =  widget.abplus;
  O_plus =  widget.oplus;
  A_neg =  widget.aneg;
  B_neg =  widget.bneg;
  O_neg =  widget.oneg;
  AB_neg =  widget.abneg;
  
    
    print('yallllllahwy');
 

 
      

    }
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home:Scaffold(

      backgroundColor: Color(0xFF035F6D),
      appBar: AppBar(
        backgroundColor: Color(0xFF8F0026),
        title: Text('Blood Bank Inventory'),
      ),
      body:Container (

        child: ListView(
          children: [

        Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // shrinkWrap: true,
               // scrollDirection:Axis.vertical ,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Colors.blue[100],
                      // child: Container(
                      //width: 500,
                      child: Padding(
                        padding: EdgeInsets.all(30) ,
                        child: Text('  List of blood types'
                         , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                           ),

                        ),
                      ),
                      //),
                      elevation: 5,
                    ),
                  ),

                  Container(
                    width: double.infinity,
                   // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width: 45,
                              child: Text("A+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),

                       RaisedButton(onPressed: (){
                             A_plus = Blood(1, A_plus);
                             print(A_plus);
                             
                             Firestore.instance.collection('bloodBank').doc('Aplus').set({
                               'num':  A_plus,

                             });

                             },
                              color:  Color(0xFF8F0026),
                            shape: CircleBorder(),
                         // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text('$A_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),


                           RaisedButton(onPressed: (){
                             A_plus =  Blood(0, A_plus);
                              print(A_plus);
                             print(A_plus.toString());
                             Firestore.instance.collection('bloodBank').doc('Aplus').set({
                               'num':  A_plus,

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                              ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("A-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          //Padding(
                            //padding: EdgeInsets.only( right: 15,  left: 15, top: 10 , bottom: 10) ,
                            RaisedButton(onPressed: (){
                              A_neg = Blood(1, A_neg);
                               print(A_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Aneg').set({
                               'num':  A_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),
                         // ),

                          Text( ' $A_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              A_neg= Blood(0, A_neg);

                               print(A_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Aneg').set({
                               'num':  A_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("B+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                         RaisedButton(onPressed: (){
                              B_plus = Blood(1, B_plus);
                                print(B_plus );
                           
                             Firestore.instance.collection('bloodBank').doc('Bplus').set({
                               'num':  B_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $B_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              B_plus = Blood(0, B_plus);
                               print(B_plus );
                           
                             Firestore.instance.collection('bloodBank').doc('Bplus').set({
                               'num':  B_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 10 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:60,
                              child: Text("AB-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              AB_neg = Blood(1, AB_neg);
                               print(AB_neg );
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  AB_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $AB_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              AB_neg= Blood(0, AB_neg);
                               print(AB_neg );
                           
                             Firestore.instance.collection('bloodBank').doc('ABneg').set({
                               'num':  AB_neg.toString(),

                             });
                              
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("B-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          RaisedButton(onPressed: (){
                              B_neg = Blood(1, B_neg);
                               print(B_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Bneg').set({
                               'num':  B_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $B_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                          RaisedButton(onPressed: (){
                              B_neg= Blood(0, B_neg);
                                print(B_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('Bneg').set({
                               'num':  B_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 10 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:60,
                              child: Text("AB+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              AB_plus = Blood(1, AB_plus);
                                print(AB_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  AB_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),

                          Text( ' $AB_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              AB_plus= Blood(0, AB_plus);
                                 print(AB_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('ABplus').set({
                               'num':  AB_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("O+"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                          RaisedButton(onPressed: (){
                              O_plus= Blood(1, O_plus);
                                 print(O_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('oplus').set({
                               'num':  O_plus.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $O_plus',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              O_plus= Blood(0, O_plus);
                                 print(O_plus);
                           
                             Firestore.instance.collection('bloodBank').doc('oplus').set({
                               'num':  O_plus.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 50,
                    child: Card(
                      color: Colors.blueGrey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children : <Widget>[

                          Padding(
                            padding: EdgeInsets.only(left : 30,right : 20 , top: 10 , bottom: 10) ,
                            child: Container(
                              width:45,
                              child: Text("O-"
                                , style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),),
                            ),
                          ),


                           RaisedButton(onPressed: (){
                              O_neg = Blood(1, O_neg);
                                  print(O_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('oneg').set({
                               'num':  O_neg.toString(),

                             });

                            },
                              color:  Color(0xFF8F0026),
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("+"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                          Text( ' $O_neg',
                            style: TextStyle( fontSize: 25 ,
                              color: Colors.black,

                            ),
                          ),

                           RaisedButton(onPressed: (){
                              O_neg= Blood(0, O_neg);
                                  print(O_neg);
                           
                             Firestore.instance.collection('bloodBank').doc('oneg').set({
                               'num':  O_neg.toString(),

                             });
                            },
                              shape: CircleBorder(),
                              // padding:EdgeInsets.all(10),
                              color:  Color(0xFF8F0026) ,
                              child: Padding(
                                padding: EdgeInsets.all(10) ,
                                child: Text("-"
                                  , style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

           ],
          ),
          
      ],
        ),
      ),
      ),
    );
  }
}