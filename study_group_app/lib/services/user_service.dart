import 'package:study_group_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String uid;

  UserService({this.uid});

  // A reference to the users collection in Firebase
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // Updates (sets if doesn't exist) user Data in users collection
  Future updateUserFields(
      String email, String userName, String firstName, String lastName) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  // Updates user name within the 'users' collection
  Future updateUserName(String userName) async {
    return await userCollection
        .document(uid)
        .updateData({'userName': userName});
  }

  // Provides stream of user data to the app
  Stream<User> get userData {
    // return userCollection.document(uid).snapshots().map(_userData);
    return userCollection
        .document(uid)
        .snapshots()
        .map((snap) => User.fromFirestore(snap));
  }
}
