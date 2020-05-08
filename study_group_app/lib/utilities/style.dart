import 'package:flutter/material.dart';

ThemeData appTheme() {
  // These are all parameters of ThemeData. We can set them here and then use
  // throughout the app.
  return ThemeData(
      appBarTheme: AppBarTheme(
        color: Color(0xFF437c90),
      ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 29,
          letterSpacing: 1.0,
        )
      ),
      
      
      // To use hex colors, use Color() and prefix hex with 0xff
      primaryColor: Colors.grey[900],
      brightness: Brightness.light,
      accentColor: Colors.white,
      // secondaryHeaderColor: Color(0xff007c91),
      secondaryHeaderColor: Colors.grey[600],
      // hintColor: Colors.grey[400],
      textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.white)),
      dividerColor: Colors.grey[700],
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w100,
            fontSize: 12.0),
      ),
      scaffoldBackgroundColor: Colors.white,
      // Background color of bottom navbar
      canvasColor: Colors.grey[300],
      backgroundColor: Color(0xFF98c1d9));
      //backgroundColor: Colors.grey[700]);
     
}
