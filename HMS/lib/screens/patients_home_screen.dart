import 'package:HMS/screens/home/MyProfile.dart';

import './message_list_screen.dart';

import './chat_screen.dart';
import './history_screen.dart';
import '../widget/patient_home/NiceButton.dart';
import '../widget/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/my_appointment_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  void moveToMyHistory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      HistoryScreen.nameRoute,
    );
  }

  void moveToMyAppointment(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MyAppointmentScreen.nameRoute,
    );
  }

  void moveToChat(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MessageListScreen.nameRoute,
    );
  }
void moveToMyProfile(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MyProfile.nameRoute,
    );
  }
  static const nameRoute = "/patient-home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 95, 109, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
        title: Text("Home"),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              ),
            ),
          ),

          NiceButton(
            onPressed: moveToMyProfile,
            nameOfButton: "My Profile",
            heightOfButton: 75,
          ),
          NiceButton(
            onPressed: moveToMyAppointment,
            nameOfButton: "My Appointments",
            widthOfButton: double.infinity,
            heightOfButton: 75,
          ),
          NiceButton(
            onPressed: moveToMyHistory,
            nameOfButton: "My Midical History",
            widthOfButton: double.infinity,
            heightOfButton: 75,
          ),
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
        onPressed: () =>moveToChat(context),
      ),
    );
  }
}
