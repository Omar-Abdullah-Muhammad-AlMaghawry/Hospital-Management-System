import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
    .map((FirebaseUser user) => _userFromFirebaseUser(user));
    //  .map(_userFromFirebaseUser);
  }

//Anon sign-in
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//E-mail & password sign-in

//Register (e-mail & password)

//Sign out

}
