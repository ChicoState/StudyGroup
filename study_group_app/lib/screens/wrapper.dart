import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/screens/home/home.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/auth/auth_view.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    // This is what keeps track of changes from main's StreamProvider
    final user = Provider.of<User>(context);

    // Depending on if a user is logged in or out, a different screen will be shown
    return user == null ? AuthView() : HomePage(title: title);
  }
}
