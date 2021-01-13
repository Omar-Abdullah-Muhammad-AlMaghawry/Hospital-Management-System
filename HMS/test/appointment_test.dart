import 'package:HMS/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// class MockUser extends Mock implements User {}

// final MockUser _mockUser = MockUser();

// class MockFirebaseAuth extends Mock implements FirebaseAuth {
//   @override
//   Stream<User> authStateChanges() {
//     return Stream.fromIterable([_mockUser]);
//   }
// }

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final mockAuth = MockFirebaseAuth();
  
  // final MockFirebaseAuth mockAuth = MockFirebaseAuth();
  final AuthService auth = AuthService(auth0: mockAuth);
  final result = await mockAuth.signInAnonymously();
  final user = result.user;
  print(user.displayName);

  setUp(() {});
  tearDown(() {});
  // test(
  //   "emmit occurs",
  //   () async {
  //     expectLater(
  //       auth.user,
  //       emitsInOrder([user]),
  //     );
      test("Create account", () {
        when(mockAuth.createUserWithEmailAndPassword(
                email: "noha@p.com", password: "1234567"))
            .thenAnswer((realInvocation) => null);
        expect(
            auth.registerWithEmailAndPassword(
                email: "noha@p.com", password: "1234567"),
            "success");
      });
  //   },
  // );
}
