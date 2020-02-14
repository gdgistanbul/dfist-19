import 'package:flutter/material.dart';

class Constants {
  static String appName = "GeekDay";

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

  static String type(type) {
    switch (type) {
      case "Mobile Technologies":
        return "assets/red.png";
      case "Flutter":
        return "assets/red.png";
      case "Design":
        return "assets/red.png";
      case "Machine Learning & AI":
        return "assets/cloud.png";
      case "Machine Learning & Ai":
        return "assets/cloud.png";
      case "Cloud":
        return "assets/cloud.png";
      case "Web Technologies":
        return "assets/web.png";
      case "Robotics & assistant":
        return "assets/red.png";
      case "Firebase":
        return "assets/web.png";
      default:
        return "assets/red.png";
    }
  }

  static int hall(type) {
    switch (type) {
      case "Bosphorus(Uniq Hall)":
        return 0;
      case "Galata Tower(Glass Room)":
        return 1;
      case "Maiden's Tower":
        return 2;
      case "Hagia Sophia":
        return 3;
      default:
        return 0;
    }
  }

  static Color color(type) {
    switch (type) {
      case "Mobile Technologies":
        return Color(0xff84E07A);
      case "Flutter":
        return Color(0xff84E07A);
      case "Design":
        return Color(0xffE07AB3);
      case "Cloud":
        return Color(0xff7A9DE0);
      case "Machine Learning & AI":
        return Color(0xffE17F7F);
      case "Machine Learning & Ai":
        return Color(0xffE17F7F);
      case "Web Technologies":
        return Color(0xffFECC92);
      case "Robotics & assistant":
        return Color(0xff7AD7E0);
      case "Firebase":
        return Color(0xffFECC92);
      default:
        return Color(0xffF1823B);
    }
  }
}

enum Type { RED, BLUE, YELLOW }
