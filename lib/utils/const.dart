import 'package:flutter/material.dart';

class Constants {
  static String appName = "DevFest Istanbul";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.yellow[800];
  static Color darkAccent = Colors.purpleAccent[900];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color timeBG = Color(0xff5563ff);
  static Color transparent = Colors.transparent;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

enum Type{
  RED,
  BLUE,
  YELLOW
}
