import 'package:HMS/screens/MyScuduleScreen.dart';
import 'package:HMS/screens/doctors_home_screen.dart';
import 'package:HMS/screens/doctors_list_screen%20copy.dart';
import 'package:HMS/screens/home/MyProfile.dart';
import 'package:HMS/screens/message_list_screen.dart';
import 'package:HMS/screens/stastistacs_screens.dart';

import './screens/auth_screens.dart';
import './screens/chat_screen.dart';
import './screens/history_screen.dart';
import './screens/my_appointment_screen.dart';
import './screens/patients_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'widget/NiceButton.dart';
import 'widget/CardWidget.dart';
//import 'package:intl/intl.dart';
import 'widget/CardHistoryWidget.dart';
//import 'widget/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/my_appointment_screen.dart';
import './models/users.dart';
import './screens/wraper.dart';
import './services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp01());
}

class MyApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return StreamProvider<Client>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
    // MaterialApp(
      title: 'HMS',
      //theme: ThemeData(primarySwatch:/*Color.fromARGB(1, 3, 95, 109)*/ ),
       //home:
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
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(3, 95, 109, 1),
        // primaryColor: Color.fromRGBO(3, 95, 109, 1),
      ),
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
        PatientHomeScreen.nameRoute: (context) => PatientHomeScreen(),
        DoctorsHomeScreen.nameRoute: (context) => DoctorsHomeScreen(),
        MyAppointmentScreen.nameRoute: (contexy) => MyAppointmentScreen(),
        HistoryScreen.nameRoute: (context) => HistoryScreen(),
        ChatScreen.nameRoute: (context) => ChatScreen(),
        MessageListScreen.nameRoute: (context) => MessageListScreen(),
        DoctorsListScreen.nameRoute: (context) => DoctorsListScreen(),
        MyProfile.nameRoute:(context)=>MyProfile(),
      
         MyStastisticScreen.nameRoute:(context)=>MyStastisticScreen(),
      },

      //MyHomePage(),
///fatma
        )
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
