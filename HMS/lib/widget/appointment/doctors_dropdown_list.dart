import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorsDropDownList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (ctx, snapshots) {
          final doctorsDocs = snapshots.data.documents;
          return ListView.builder(
              itemCount: doctorsDocs.length,
              itemBuilder: (ctx, index) {
                return DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [Text(doctorsDocs[index]["userName"])],
                    ),
                  ),
                );
              });
        });
  }
}
