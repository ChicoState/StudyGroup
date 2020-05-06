import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_group_app/services/user_service.dart';

class Auth {
  // Create a local instance of our Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Provides a stream to continually update user data from Firebase
  Stream<FirebaseUser> get getUser {
    return _auth.onAuthStateChanged;
  }

  Future signInUserWithEmail(String email, String password) async {
    try {
      // Attempt to sign in user to Firebase
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Get the Firebase User object back
      FirebaseUser user = result.user;

      // Convert Firebase User to local user object
      return user;
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
      await UserService(uid: newUser.uid)
          .updateUserFields(email, 'UserName', 'John', 'Doe');
      return newUser;
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
