import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../moduls/checker_appointments.dart';
import '../../moduls/stastistacsData_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Stastistics extends StatefulWidget {
  @override
  _StastisticsState createState() => _StastisticsState();
}

class _StastisticsState extends State<Stastistics> {
  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("appointments")
          .orderBy("created At")
          .snapshots(),
      builder: (ctx, appointSnapshots) {
        final appointmentDocs = appointSnapshots.data.documents;

        if (appointSnapshots.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: appointmentDocs.length,
          itemBuilder: (ctx, index) {
            final scuList =
                Checker(date: appointmentDocs[index]["date"]).checkIfToday();
            return Container(
              child: SfCartesianChart(
                series: [
                  StackedColumnSeries<StastistacsData, String>(
                    dataSource: scuList,
                    xValueMapper: (StastistacsData xdate, _) => xdate.date,
                    yValueMapper: (StastistacsData yCount, _) => yCount.counter,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
