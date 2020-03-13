import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/services/user_provider.dart';

class Auth {
  // Create a local instance of our Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Need to match a user's Firebase user uid to local Class User
  User _userFromFirebaseUid(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  // Provides a stream to continually update user data from Firebase
  Stream<User> get getUser {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUid(user));
  }

  Future signInUserWithEmail(String email, String password) async {
    try {
      // Attempt to sign in user to Firebase
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Get the Firebase User object back
      FirebaseUser user = result.user;

      // Convert Firebase User to local user object
      return _userFromFirebaseUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerNewUser(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser newUser = result.user;

      // Create a new document in Firebase with the same uid
      await UserProvider(uid: newUser.uid)
          .updateUserFields(email, 'UserName', 'John', 'Doe');
      return _userFromFirebaseUid(newUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future changeFirebaseUserEmail(String email) async {
    FirebaseUser user = await _auth.currentUser();
    try {
      return user.updateEmail(email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logOut() async {
    return await _auth.signOut();
  }
}
