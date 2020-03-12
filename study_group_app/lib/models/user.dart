class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String email;
  final String userName;
  final String firstName;
  final String lastName;

  UserData(
      {this.uid, this.email, this.userName, this.firstName, this.lastName});
}
