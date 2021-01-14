import 'dart:io';

import 'package:HMS/services/auth.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:HMS/models/users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() async {
  setUp(() async {});

  final auth = MockFirebaseAuth();
  // final result = await auth.signInAnonymously();
  AuthService authService = AuthService(
      auth0: auth,
      testFirestore: MockFirestoreInstance(),
      testStorage: MockFirebaseStorage());

  group('Tests for AuthService class:', () {
    test('Sign in with email and password', () async {
      dynamic result = await authService.signInWithEmailAndPassword(
          'email@doctor.com', '123456789');
      expect(result is Client, true);
    });
    test('Sign in then out', () async {
      dynamic result = await authService.signInWithEmailAndPassword(
          'email@doctor.com', '123456789');
      expect(result is Client, true);
      result = await authService.signOut();
      expect(result, null);
    });
  });

  tearDown(() {});
}
