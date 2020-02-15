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
      case "Google Teknolojileri":
        return "assets/red.png";
      case "Mobil Teknolojileri":
        return "assets/red.png";
      case "Web Teknolojileri":
        return "assets/red.png";
      case "Tasarım":
        return "assets/cloud.png";
      case "Oyun Geliştirme":
        return "assets/cloud.png";
      case "Yapay Zeka":
        return "assets/cloud.png";
      case "Siber Güvenlik":
        return "assets/web.png";
      case "Blockchain":
        return "assets/red.png";
      case "IOT":
        return "assets/web.png";
      default:
        return "assets/red.png";
    }
  }

  static int hall(type) {
    switch (type) {
      case "[GEEKDAY_HALL_1]":
        return 0;
      case "[GEEKDAY_HALL_2]":
        return 1;
      case "[GEEKDAY_HALL_3]":
        return 2;
      default:
        return 0;
    }
  }

  static Color color(type) {
    switch (type) {
      case "Google Teknolojileri":
        return Color(0xff84E07A);
      case "Mobil Teknolojileri":
        return Color(0xff84E07A);
      case "Web Teknolojileri":
        return Color(0xffE07AB3);
      case "Tasarım":
        return Color(0xff7A9DE0);
      case "Oyun Geliştirme":
        return Color(0xffE17F7F);
      case "Yapay Zeka":
        return Color(0xffE17F7F);
      case "Siber Güvenlik":
        return Color(0xffFECC92);
      case "Blockchain":
        return Color(0xff7AD7E0);
      case "IOT":
        return Color(0xffFECC92);
      default:
        return Color(0xffF1823B);
    }
  }
}

enum Type { RED, BLUE, YELLOW }
