import 'package:HMS/screens/FrontDesk.dart/IntensiveForm.dart';
import 'package:HMS/screens/FrontDesk.dart/NormalForm.dart';
import 'package:flutter/material.dart';

class BedReservation extends StatefulWidget {
  @override
  _BedReservationState createState() => _BedReservationState();
}

class _BedReservationState extends State<BedReservation> {
  int totaln = 300;
  int freen = 100;
  int busyn = 200;
  int totali = 50;
  int freei = 10;
  int busyi = 40;
  void _freen() {
    setState(() {
      if (busyn < 300) {
        busyn++;
        freen = totaln - busyn;
      }
    });
  }

  void _freen1() {
    setState(() {
      if (busyn > 0) {
        busyn--;
        freen = totaln - busyn;
      }
    });
  }

  void _freei() {
    setState(() {
      if (busyi < 50) {
        busyi++;
        freei = totali - busyi;
      }
    });
  }

  void _freei1() {
    setState(() {
      if (busyi > 0) {
        busyi--;
        freei = totali - busyi;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //  backgroundColor: Color(0xFFE1F5FE),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Bed reservation ',
              style: TextStyle(color: Colors.white, fontSize: 30.0)),
          //     backgroundColor: Color(0xFD6D6D6),
          actions: [
            FlatButton.icon(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text('Home',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
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
                  Text(
                    ' Normal beds',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _freen();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NormalBeds()));
                    },
                    //////////////////////////////////////////////////////////////
                    elevation: 10,
                    shape: CircleBorder(),

                    child: Text('+',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        )),
                    color: Colors.lightBlueAccent,
                  ),
                  RaisedButton(
                    onPressed: _freen1,
                    //////////////////////////////////////////////////////////////
                    elevation: 10,
                    shape: CircleBorder(),
                    child: Text('-',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        )),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              //   //////////////////////////////////
              SizedBox(
                height: 10,
                width: 10,
              ),

              Row(
                children: <Widget>[
                  Text(
                    ' Busy : ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' $busyn', ///////////////
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    ' Free  : ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' $freen  ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ////////////////////////////
              SizedBox(
                width: 50,
                height: 50,
              ),
              ///////////////////
              Row(

                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      ' Intensive care beds',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _freei();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IntensiveBeds()));
                    },
                    //////////////////////////////////////////////////////////////
                    elevation: 10,
                    shape: CircleBorder(),

                    child: Text('+',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        )),
                    color: Colors.lightBlueAccent,
                  ),
                  RaisedButton(
                    onPressed: _freei1,
                    //////////////////////////////////////////////////////////////
                    elevation: 10,
                    shape: CircleBorder(),
                    child: Text('-',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        )),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    ' Busy  : ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' $busyi ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    ' Free   : ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' $freei ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  // DataTable(
                  //   columns: const <DataColumn>[
                  //     DataColumn(
                  //       label: Text('Name'),
                  //     ),
                  //     DataColumn(
                  //       label: Text(' jgj'),
                  //     ),
                  //     DataColumn(
                  //       label: Text(' mm'),
                  //     ),
                  //   ],
                  //   rows: const <DataRow>[
                  //     DataRow(
                  //       cells: <DataCell>[
                  //         // DataCell(Text(snapshot.data[index]['username']
                  //         //,style: TextStyle(fontSize: 20),
                  //         //),),
                  //         DataCell(
                  //           Text('02222100'),
                  //         ),
                  //         DataCell(
                  //           Text('knhi '),
                  //         ),
                  //         DataCell(
                  //           Text('ooo'),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // )
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
