import 'package:HMS/screens/Radiology/MyScheduleRadScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../masterHome.dart';
import '../MyProfile.dart';
import 'rad_appointment_screen.dart';

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



class RadiologyHomeScreen extends StatelessWidget {
  // void moveToMyHistory(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(
  //     HistoryScreen.nameRoute,
  //   );
  // }

  void moveToMySchedule(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MyScuduleRadScreen.nameRoute,
    );
  }

  void moveToMyAppointment(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      RadAppointmentScreen.nameRoute,
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

  static const nameRoute = "/rad-home";
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
                image: AssetImage("assets/images/images (3).jpg"
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
            onPressed: moveToMySchedule,
            nameOfButton: "My Schedule",
            heightOfButton: 75,
          ),

          NiceButton(
            onPressed: moveToMyAppointment,
            nameOfButton: "Radiology Appointments",
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
