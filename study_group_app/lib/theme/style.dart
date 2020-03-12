import 'package:flutter/material.dart';

ThemeData appTheme() {
  // These are all parameters of ThemeData. We can set them here and then use
  // throughout the app.
  return ThemeData(
      // To use hex colors, use Color() and prefix hex with 0xff
      primaryColor: Colors.grey[900],
      brightness: Brightness.light,
      accentColor: Color(0xFF212121),
      // secondaryHeaderColor: Color(0xff007c91),
      secondaryHeaderColor: Colors.grey[600],
      hintColor: Color(0xff5ddef4),
      textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
          headline: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.white)),
      dividerColor: Colors.grey[700],
      buttonColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.grey[300],
      backgroundColor: Colors.grey[700]);
}

class Fonts {
  static const baseTextStyle = TextStyle(fontFamily: 'Poppins');
  static const headerTextStyle = TextStyle(
      fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600);
}
