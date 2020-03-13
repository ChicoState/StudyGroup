import 'package:flutter/material.dart';
import 'package:study_group_app/screens/auth/login.dart';
import 'package:study_group_app/screens/auth/register.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool needsToRegister = false;

  void registerOrSignIn() {
    setState(() {
      needsToRegister = !needsToRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (needsToRegister) {
      return Register(view: registerOrSignIn);
    } else {
      return LoginPage(view: registerOrSignIn);
    }
  }
}
