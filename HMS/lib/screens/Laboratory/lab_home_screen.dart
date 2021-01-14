import 'package:HMS/screens/Laboratory/MyScheduleLabScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../masterHome.dart';
import '../MyProfile.dart';
import './lab_appointment_screen.dart';

import '../doctors/MyScheduleScreen.dart';

import '../chat/doctorchatlist.dart';
import '../chat/message_list_screen.dart';
import '../../widgets/DoctorDrawer.dart';
import '../chat/chat0_screen.dart';
import '../patient/history_screen.dart';
import '../../widget/patient_home/NiceButton.dart';
import '../../widget/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './bloodbank.dart';

class LabHomeScreen extends StatelessWidget {
  // void moveToMyHistory(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(
  //     HistoryScreen.nameRoute,
  //   );
  // }
  int xaplus;
  int xaneg;
  int xbplus;
  int xbneg;
  int xabplus;
  int xabneg;
  int xoplus;
  int xoneg;
  int x;
  ///////////////////////////////////////////////
  ///

  Future getnumofbloodbags() async {
    Map x;
    int v;
    String aplus;
    ////////////APLUS
    await Firestore.instance
        .collection('bloodBank')
        .doc('Aplus')
        .get()
        .then((value) {
      x = value.data();
    });
    // print(x['num']);
    dynamic y = x['num'];
    // print(y);
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xaplus = v;
////////////ANEG
    await Firestore.instance
        .collection('bloodBank')
        .doc('Aneg')
        .get()
        .then((value) {
      x = value.data();
    });

    y = x['num'];

    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xaneg = v;

    ////////Bplus
    await Firestore.instance
        .collection('bloodBank')
        .doc('Bplus')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xbplus = v;

    ///Bneg
    await Firestore.instance
        .collection('bloodBank')
        .doc('Bneg')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xbneg = v;
    /////////ABplus
    await Firestore.instance
        .collection('bloodBank')
        .doc('ABplus')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xabplus = v;
    /////ABneg
    await Firestore.instance
        .collection('bloodBank')
        .doc('ABneg')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xabneg = v;

    ///Oplus
    await Firestore.instance
        .collection('bloodBank')
        .doc('oplus')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xoplus = v;
    ///////Oneg

    await Firestore.instance
        .collection('bloodBank')
        .doc('oneg')
        .get()
        .then((value) {
      x = value.data();
    });
    y = x['num'];
    print(y.toString());
    aplus = y.toString();
    v = int.parse(aplus);
    xoneg = v;

    ////////////////////////////////////////////
    return v;

    ///the v is right //tested
  }

  void moveToMySchedule(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MyScuduleLabScreen.nameRoute,
    );
  }

  void moveToMyAppointment(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      LabAppointmentScreen.nameRoute,
    );
  }

  void moveToChat(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MessageListScreen.nameRoute,
    );
  }

  void moveToMyProfile(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(
    //   MessageListScreen.nameRoute,
    // );
    Navigator.of(ctx).pushNamed(MyProfile.nameRoute);
  }

  static const nameRoute = "/lab-home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //  backgroundColor: Color.fromRGBO(3, 95, 109, 1),
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text('Log out',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(
                  context, ModalRoute.withName(MasterHome.nameRoute));
            },
          )
        ],
        title: Text("Home"),
      ),
      drawer: DoctorDrawer(),
      // MainDrawer(),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/images (2).jpg"
                    // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
                    // "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.aarp.org%2Fhealth%2Fconditions-treatments%2Finfo-2020%2Fer-precautions-coronavirus&psig=AOvVaw1OFovfkSNQvLM2UAcQvrBe&ust=1610589040353000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIiu-ojml-4CFQAAAAAdAAAAABAo"

                    ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          NiceButton(
            onPressed: moveToMyProfile,
            nameOfButton: "My Profile",
            heightOfButton: 75,
          ),
          NiceButton(
            onPressed: (context) async {
              print('pRESSSSSSS');

              x = await getnumofbloodbags();
              print(x);
              print('navigating');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bloodbank(
                    aplus: xaplus,
                    bplus: xbplus,
                    oplus: xoplus,
                    abplus: xabplus,
                    abneg: xabneg,
                    aneg: xaneg,
                    bneg: xbneg,
                    oneg: xoneg,
                  ),
                ),
              );
            },
            nameOfButton: "BLOOD BANK",
            heightOfButton: 75,
          ),
          // Container(
          //   child: FlatButton(
          //     child: Text('BLOOD BANK'),
          //     color: Colors.green,
          // onPressed: () async {
          //   print('pRESSSSSSS');

          //   x = await getnumofbloodbags();
          //   print(x);
          //   print('navigating');
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Bloodbank(
          //         aplus: xaplus,
          //         bplus: xbplus,
          //         oplus: xoplus,
          //         abplus: xabplus,
          //         abneg: xabneg,
          //         aneg: xaneg,
          //         bneg: xbneg,
          //         oneg: xoneg,
          //       ),
          //     ),
          //   );
          // },
          //   ),
          // ),
          NiceButton(
            onPressed: moveToMySchedule,
            nameOfButton: "My Schedule",
            heightOfButton: 75,
          ),

          NiceButton(
            onPressed: moveToMyAppointment,
            nameOfButton: "Lab Appointments",
            widthOfButton: double.infinity,
            heightOfButton: 75,
          ),
          // NiceButton(
          //   onPressed: null,
          //   nameOfButton: "My Statistics",
          //   widthOfButton: double.infinity,
          //   heightOfButton: 75,
          // ),
          //     CardWidget(
          //       titleOfCardApp: "Analysis",
          //       bodyOfCardApp: ['Doctor: Ahmed', 'afs'],
          //       dateOfReservation: DateTime.now(),
          //     ),
          //     CardWidget(
          //       titleOfCardApp: "Radiation",
          //       bodyOfCardApp: ['Doctor: Youef', 'sasa'],
          //       dateOfReservation: DateTime.now(),
          //     ),
          //     CardHistoryWidget(
          //       titleOfCardApp: "Friday",
          //       bodyOfCardApp: ['Doctor: Mohamed', 'ada'],
          //       dateOfReservation: DateTime.now(),
          //     ),
          //     CardHistoryWidget(
          //       titleOfCardApp: "SatrDay",
          //       bodyOfCardApp: ['Doctor: Ali', 'JFGD'],
          //       dateOfReservation: DateTime.now(),
          //     ),
          //   ],
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorChatList(),
          ),
        ),
        // () => moveToChat(context),
      ),
    );
  }
}
