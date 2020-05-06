import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String userName;
  final String firstName;
  final String lastName;
  var groups;

  User(
      {this.uid,
      this.email,
      this.userName,
      this.firstName,
      this.lastName,
      this.groups});

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data;
    return User(
      uid: doc.documentID,
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      groups: map['groups'] ?? '',
    );
  }
}
