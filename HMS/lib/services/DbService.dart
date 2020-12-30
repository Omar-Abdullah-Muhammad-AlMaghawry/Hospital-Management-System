import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('abdo-partients-test');

  Stream<QuerySnapshot> get getPatients {
    return patients.snapshots();
  }
}
