
//////////////// bed reservation

import 'package:flutter/material.dart'  ;
void main() {
  runApp(Homepage ());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int totaln=300;
  int freen = 100;
  int busyn =200;
  int totali=50;
  int freei = 10 ;
  int busyi =40;
  void _freen() {
    setState(() {
      busyn++;
      freen = totaln-busyn;
    });
  }
  void _freen1() {
    setState(() {
      busyn--;
      freen = totaln-busyn;
    });
  }
  void _freei() {
    setState(() {
      busyi++;
      freei = totali- busyi;
    });
  }
  void _freei1() {
    setState(() {
      busyi--;
      freei = totali- busyi;
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(
          title: Text('Bed reservation ',
            style: TextStyle(fontSize: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFD6D6D6),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


              ],
            ),
          ],
        ),

        body: Container(
          margin: EdgeInsets.all(20),
         child: Column(
           children: <Widget>[
             SizedBox(
               height: 75,
               width: 75,
             ),
              //Expanded(
             // child:
              Row(


                  children: <Widget>[
              Text(' Normal beds',
                 style: TextStyle( fontSize: 30 ,
                 color: Colors.black,
               ),
             ),
          ],
        ),
               Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
               RaisedButton( onPressed:_freen,
                      //////////////////////////////////////////////////////////////
                     elevation: 10,
                      shape:CircleBorder(),

                      child : Text( '+',
                          style: TextStyle( fontSize: 40,
                            color: Colors.black,
                          )
                      ),
                      color:Colors.lightBlueAccent,

                    ),


                  RaisedButton(
                    onPressed: _freen1,
                      //////////////////////////////////////////////////////////////
                      elevation: 10,
                      shape: CircleBorder() ,
                      child : Text( '-',
                          style: TextStyle( fontSize: 40,
                            color: Colors.black,
                          )
                      ),
                      color:Colors.lightBlueAccent,

                    ),

                  ],
                ),
           //   //////////////////////////////////
             SizedBox(
               height: 10,
               width: 10 ,
             ),

             Row(
               children: <Widget>[
                 Text(' Busy : ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),

                 Text( ' $busyn',///////////////
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
               ],
             ),
             SizedBox(
               height: 10,
               width: 10 ,
             ),
             Row(
               children: <Widget>[
                 Text(' Free  : ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
                 Text( ' $freen  ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
               ],
             ),
             ////////////////////////////
             SizedBox(width: 50,
               height: 50,
             ),
             ///////////////////
             Row(

               //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Text(' Intensive care beds',
                   style: TextStyle( fontSize: 30 ,
                     color: Colors.black,
                   ),
                 ),
               ]
             ),
          Row(

              mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
                 RaisedButton( onPressed:_freei,
                   //////////////////////////////////////////////////////////////
                   elevation: 10,
                   shape:CircleBorder(),

                   child : Text( '+',
                       style: TextStyle( fontSize: 40,
                         color: Colors.black,
                       )
                   ),
                   color:Colors.lightBlueAccent,

                 ),
                 RaisedButton(
                   onPressed: _freei1,
                   //////////////////////////////////////////////////////////////
                   elevation: 10,
                   shape: CircleBorder() ,
                   child : Text( '-',
                       style: TextStyle( fontSize: 40,
                         color: Colors.black,
                       )
                   ),
                   color:Colors.lightBlueAccent,

                 ),

        ],
                ),
             SizedBox(
               height: 10,
               width: 10 ,
             ),
             Row(
               children: <Widget>[
                 Text(' Busy  : ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
                 Text( ' $busyi ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
               ],
             ),
            SizedBox(
              height: 10,
              width: 10 ,
            ),
             Row(
               children: <Widget>[
                 Text(' Free   : ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),

                 Text( ' $freei ',
                   style: TextStyle( fontSize: 25 ,
                     color: Colors.black,
                   ),
                 ),
                 DataTable(
                     columns  :const<DataColumn>[
                       DataColumn(label: Text('Name'),),
                       DataColumn(label: Text(' jgj'),),
                       DataColumn(label: Text(' mm'),),
                     ],
                     rows  :const<DataRow>[
                       DataRow(cells : <DataCell> [
                        // DataCell(Text(snapshot.data[index]['username']
                         //,style: TextStyle(fontSize: 20),
                       //),),
                         DataCell(Text('02222100'),),
                         DataCell(Text('knhi '),),
                         DataCell(Text('ooo'),),
                       ],
                       ),
                     ],

                     )
               ],
             ),
             ////////////////////////////
          ],
        ),
      ),
        ),
      );

  }
}
