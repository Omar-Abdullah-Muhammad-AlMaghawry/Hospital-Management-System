import 'dart:math';

import 'package:flutter/material.dart';
class RandomGen extends StatefulWidget {
  @override
  _RandomGenState createState() => _RandomGenState();
}

class _RandomGenState extends State<RandomGen> {
  int rand(){
    Random random = Random();
    var number = random.nextInt(10000000);
    return number;
  }
  String xnum;
  String xnum2;
 @override
  void initState() {
    super.initState();
    xnum = rand().toString();
    xnum2 = rand().toString();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFE1F5FE),
        appBar: AppBar(
          title: Text('Payment Code',
          style: TextStyle(
            color:Colors.black,
          ),),
          backgroundColor: Color(0xFFD6D6D6),
        ),
        body:

          ListView(
            children: [
              Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 80, 10, 80),
                    child: Card(
                      child:Column(
                       // crossAxisAlignment:CrossAxisAlignment.start,
                        
                        
                        children: [
                          Text(
                           ' MASR Hospital',
                          
                          style: TextStyle(
                        fontSize: 30,
                       // backgroundColor:  Color(0xFFD6D6D6),
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                      ),
                      ), 
                        


                     SizedBox(height:20,),
                     Divider(height: 10,
                     color: Colors.black38,
                     
                     ),
                  
                     Icon(Icons.check_circle,
                     color:Colors.green[300] ,
                       size: 150,
                       
                       ),
                        
                     Text('Order Number:',
                      style: TextStyle(
                        fontSize: 40,
                       // backgroundColor:  Color(0xFFD6D6D6),
                        color: Colors.black,
                      ),
                      ) ,
                      SizedBox(height:40,),
                      Text(xnum+xnum2,
                      style: TextStyle(
                        fontSize: 40,
                        //backgroundColor:  Color(0xFFD6D6D6),
                        color: Colors.black,
                      ),
                      ) ,
                      SizedBox(height:50),
                      Container(
                        decoration: BoxDecoration(
                     boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(0, 0),
                      blurRadius: 10,
                     
                    )
                  ],
                        ),
                        child: FlatButton(
                          
                          
                          onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('close',style: TextStyle(fontSize: 30),
                        )),
                      )




                      ],),

                    ),
                  ),
                ),
       
            ],
          ),

      ),
    );
  }
}
