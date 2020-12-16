import 'package:HMS/widget/appointment/CardWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAppointmenyt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("myappointments")
                .snapshots(),
            builder: (ctx, appointSnapshot) {
              if (appointSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              final appointmentDocs = appointSnapshot.data;
              return ListView.builder(
                  itemCount: appointSnapshot.data.length,
                  itemBuilder: (ctx, index) {
                    return CardWidget(
                      bodyOfCardApp: [
                        appointmentDocs[index]["doctor"],
                        appointmentDocs[index]["department"],
                        appointmentDocs[index]["time"]
                      ],
                    );
                  });
            })
      ],
    );
  }
}
