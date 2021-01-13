import 'package:HMS/screens/authenticate/register.dart';
import 'package:HMS/screens/authenticate/sign_in.dart';
import 'package:HMS/screens/wraper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/src/services/asset_bundle.dart';

// void main() => runApp(Homepage());

// class hospitalimage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build

//     AssetImage image = new AssetImage('assets/images/hospital.jpg');
//     Image image1 = new Image(
//       image: image,
//       fit: BoxFit.fill,
//     );
//     return Container(child: image1);
//   }
// }

class MasterHome extends StatefulWidget {
  static const nameRoute = '/masterHome';
  @override
  _MasterHomeState createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 680.00,
              floating: false,
              pinned: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.00),
                    bottomLeft: Radius.circular(50.00)),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // RaisedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => Register()));
                    //   },
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //   splashColor: Color(0xFFD6D6D6),
                    //   elevation: 10,
                    //   shape: StadiumBorder(),
                    //   child: Text(' Sign up ',
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         color: Colors.black,
                    //       )),
                    //   color: Colors.lightBlueAccent,
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Wrapper()));
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      splashColor: Color(0xFD6D6D6),
                      elevation: 10,
                      shape: StadiumBorder(),
                      child: Text('Continue',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          )),
                      color: Colors.lightBlueAccent,
                    ),
                    // Expanded(child:   hospitalimage (), ),
                  ],
                ),
                background: Container(
                  //height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.00),
                        bottomLeft: Radius.circular(50.00)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/hospital.jpg"),
                      // 'http://www.wilsonchiros.com/blog/wp-content/uploads/2015/12/hospital.jpg'),
                      //  borderRadius: BorderRadius.only(bottomRight:Radius.circular(50.00) ,bottomLeft:Radius.circular(50.00) ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              // fillOverscroll: true,
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                      // alignment: Alignment.center,
                      // padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
                      color: Color(0xFFFFE1F5FE),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Center(
                                  child: Text(
                                    "MASR Hospital",
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      //backgroundColor: Color(0xFFB3E5FC),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Text(
                                    " Created  at 2005 ",
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Text(
                                      "Outpatient Clinics opens  everyday expect friday and saturday from 8 am : to 8 pm ",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Text(
                                      "Management System Certification:ISO 9001 ",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Container(
                                width: double.infinity,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Text(
                                      "Adress : Cairo , Maddi , 45 Street  ",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white60,
                            child: Container(
                              width: double.infinity,
                              child: Container(
                                width: double.infinity,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Text(
                                      " contact us : 1999          " +
                                          "E_mail : Masrhospital@yahoo.com",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
