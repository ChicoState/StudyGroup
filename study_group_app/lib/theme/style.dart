import 'package:flutter/material.dart';

ThemeData appTheme() {
  // These are all parameters of ThemeData. We can set them here and then use
  // throughout the app.
  return ThemeData(
    // To use hex colors, use Color() and prefix hex with 0xff
    primaryColor: Colors.cyan[600],
    accentColor: Colors.grey[900],
    secondaryHeaderColor: Color(0xff484848),
    hintColor: Color(0xff5ddef4),
    textTheme: TextTheme(
        body1: TextStyle(color: Colors.white),
        headline: TextStyle(color: Colors.black)),
    dividerColor: Color(0xff007c91),
    buttonColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.grey[300],
  );
}
