import 'package:HMS/screens/authenticate/sign_in.dart';
import 'package:HMS/services/auth.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final auth = MockFirebaseAuth();
  // final result = await auth.signInAnonymously();
  AuthService authService = AuthService(
      auth0: auth,
      testFirestore: MockFirestoreInstance(),
      testStorage: MockFirebaseStorage());
  bool view = true;
  void toggleView() {
    view = !view;
  }

  Widget _makeTestable() {
    return MaterialApp(
        home: SignIn(
      toggleView: toggleView,
    ));
  }

  var emailField = find.widgetWithText(TextFormField, 'Email');
  var passwordField = find.widgetWithText(TextFormField, 'Password');
  var signInButton = find.text('Sign In');

  group('Widget test for the sign-in page:', () {
    testWidgets('The page displays properly', (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestable());
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(signInButton, findsOneWidget);
    });

    testWidgets('Error message when invalid input is given',
        (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestable());
      await tester.enterText(emailField, '');
      await tester.enterText(passwordField, 'text');
      await tester.tap(signInButton);
      await tester.pump();
      expect(find.text('Enter an Email'), findsOneWidget);
      expect(find.text('Enter +6 chars password'), findsOneWidget);
    });
  });
}
