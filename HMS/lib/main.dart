import 'package:HMS/screens/Laboratory/MyScheduleLabScreen.dart';
import 'package:HMS/screens/Radiology/MyScheduleRadScreen.dart';
import 'package:HMS/screens/Radiology/rad_appointment_screen.dart';
import 'package:HMS/screens/Radiology/rad_home_screen.dart';

import './screens/Laboratory/lab_home_screen.dart';
import 'package:HMS/widget/appointment/lab_appointment.dart';
import './screens/Laboratory/lab_appointment_screen.dart';

import './screens//MyProfile.dart';
import './screens/doctors/my_appointment_doctors_screen.dart';
import './models/users.dart';
import './screens/masterHome.dart';
import 'screens/doctors/MyScheduleScreen.dart';
import './screens/doctors/doctors_home_screen.dart';
import './screens/wraper.dart';
import './services/auth.dart';
import 'package:provider/provider.dart';
import './screens/doctors/doctors_list_screen%20copy.dart';
import './screens/chat/message_list_screen.dart';
import './screens/auth_screens.dart';
import './screens/chat/chat0_screen.dart';
import './screens/patient/history_screen.dart';
import './screens/patient/my_appointment_screen.dart';
import './screens/patient/patients_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widget/CardWidget.dart';
import 'widget/CardHistoryWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/patient/my_appointment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp01());
}

class MyApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      //theme: ThemeData(primarySwatch:/*Color.fromARGB(1, 3, 95, 109)*/ ),
      home: StreamProvider<Client>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
          // StreamBuilder(
          //   stream: FirebaseAuth.instance.onAuthStateChanged,
          //   builder: (ctx, userSnapshot) {
          //     if (userSnapshot.hasData) {
          //       return
          //           //HistoryScreen();
          //           PatientHomeScreen();
          //       // MyAppointmentScreen();
          //       // ChatScreen();
          //       // MessageListScreen();
          //     }
          //     return AuthScreen();
          //   },
          // ),
          initialRoute: MasterHome.nameRoute,
          routes: {
            //   "/":(ctx)=>StreamBuilder(
            //   stream: FirebaseAuth.instance.onAuthStateChanged,
            //   builder: (ctx, userSnapshot) {
            //     if (userSnapshot.hasData) {
            //       return
            //      //HistoryScreen();
            //     PatientHome();
            //      // MyAppointmentScreen();
            //       //ChatScreen();

            //     }
            //     return AuthScreen();
            //   },
            // ),
            MasterHome.nameRoute: (context) => MasterHome(),
            PatientHomeScreen.nameRoute: (context) => PatientHomeScreen(),
            DoctorsHomeScreen.nameRoute: (context) => DoctorsHomeScreen(),
            MyAppointmentScreen.nameRoute: (contexy) => MyAppointmentScreen(),
            HistoryScreen.nameRoute: (context) => HistoryScreen(),
            ChatScreen.nameRoute: (context) => ChatScreen(),
            MessageListScreen.nameRoute: (context) => MessageListScreen(),
            DoctorsListScreen.nameRoute: (context) => DoctorsListScreen(),
            MyScuduleScreen.nameRoute: (context) => MyScuduleScreen(),
            MyScuduleRadScreen.nameRoute: (context) => MyScuduleRadScreen(),
            MyScuduleLabScreen.nameRoute: (context) => MyScuduleLabScreen(),
            MyProfile.nameRoute: (context) => MyProfile(),
            MyAppointmentDocScreen.nameRoute: (context) =>
                MyAppointmentDocScreen(),
                 LabAppointmentScreen.nameRoute: (context) =>
                LabAppointmentScreen(),
                RadAppointmentScreen.nameRoute: (context) =>
                RadAppointmentScreen(),
                 RadiologyHomeScreen.nameRoute: (context) =>
                RadiologyHomeScreen(),
            LabHomeScreen.nameRoute: (context) => LabHomeScreen(),
          },

          //MyHomePage(),
          theme: ThemeData(
                // Color.fromRGBO(3, 95, 109, 1),
              backgroundColor: Colors.grey[500],
          
              appBarTheme: AppBarTheme(
                color: Color.fromRGBO(0, 153, 255, 1),
              )
              //Color.fromRGBO(3, 95, 109, 1),
              // primaryColor: Color.fromRGBO(3, 95, 109, 1),
              ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(3, 95, 109, 1),
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {},
//           )
//         ],
//         title: Text("HMS"),
//       ),
//       // drawer: MainDrawer(),
//       body: ListView(
//         children: [
//           // Container(
//           //   height: 200,
//           //   width: double.infinity,
//           //   child: Image(
//           //     image: NetworkImage(
//           //         'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
//           //   ),
//           // ),
//           // NiceButton(
//           //   nameOfButton: "My Profile",
//           //   heightOfButton: 75,
//           // ),
//           // NiceButton(
//           //   nameOfButton: "My Appointments",
//           //   widthOfButton: double.infinity,
//           //   heightOfButton: 75,
//           // ),
//           // NiceButton(
//           //   nameOfButton: "My Midical History",
//           //   widthOfButton: double.infinity,
//           //   heightOfButton: 75,
//           // ),
//           CardWidget(
//             titleOfCardApp: "Analysis",
//             bodyOfCardApp: ['Doctor: Ahmed', 'afs'],
//             dateOfReservation: DateTime.now(),
//           ),
//           CardWidget(
//             titleOfCardApp: "Radiation",
//             bodyOfCardApp: ['Doctor: Youef', 'sasa'],
//             dateOfReservation: DateTime.now(),
//           ),
//           CardHistoryWidget(
//             titleOfCardApp: "Friday",
//             bodyOfCardApp: ['Doctor: Mohamed', 'ada'],
//             dateOfReservation: DateTime.now(),
//           ),
//           CardHistoryWidget(
//             titleOfCardApp: "SatrDay",
//             bodyOfCardApp: ['Doctor: Ali', 'JFGD'],
//             dateOfReservation: DateTime.now(),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.chat,
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
