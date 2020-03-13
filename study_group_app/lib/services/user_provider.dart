import 'package:study_group_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  final String uid;

  UserProvider({this.uid});

  // A reference to the users collection in Firebase
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // Updates (sets if doesn't) exist user Data in users collection
  Future updateUserFields(
      String email, String userName, String firstName, String lastName) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  Future updateUserName(String userName) async {
    return await userCollection
        .document(uid)
        .updateData({'userName': userName});
  }

  UserData _userData(DocumentSnapshot snap) {
    return UserData(
      uid: uid,
      email: snap.data['email'],
      userName: snap.data['userName'],
      firstName: snap.data['firstName'],
      lastName: snap.data['lastName'],
    );
  }

  // Provides stream of user data to
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userData);
  }
}
