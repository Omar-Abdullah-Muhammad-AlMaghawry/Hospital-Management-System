import 'package:HMS/screens/announcement_doctors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/doctors.dart';
import 'package:flutter/material.dart';

//TODO bind drawer buttons to the pages the point to.
class DoctorDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF8F0026),
            padding: EdgeInsets.symmetric(vertical: 40),
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .document(FirebaseAuth.instance.currentUser.uid)
                  .get(),
              builder: (context, snapshots) {
                final userDocs = snapshots.data;
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(userDocs['image_url']),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userDocs['userName'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnnouncedoctorScreen())),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Announcments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DoctorList())),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Outpatient Clinics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LabDoctors())),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'lab Doctors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RadiologyDoctors())),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Radiology',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              color: Colors.blue[100],
              onPressed: () => {},
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Hospital Map',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 260,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                Text(
                  'Contact us:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Phone: 07775000',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Address: شارع الشهيد ميكي ماوس',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/fb_logo.jpg'),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/twitter_logo.jpg'),
                    ),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  size: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
