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
        return "assets/empty.png";
      case "Mobil Teknolojileri":
        return "assets/empty.png";
      case "Web Teknolojileri":
        return "assets/empty.png";
      case "Tasarım":
        return "assets/empty.png";
      case "Oyun Geliştirme":
        return "assets/empty.png";
      case "Yapay Zeka":
        return "assets/empty.png";
      case "Siber Güvenlik":
        return "assets/empty.png";
      case "Blockchain":
        return "assets/empty.png";
      case "IOT":
        return "assets/empty.png";
      default:
        return "assets/empty.png";
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
        return Color(0xff2397d4);
      case "Mobil Teknolojileri":
        return Color(0xff2397d4);
      case "Web Teknolojileri":
        return Color(0xff6ab34d);
      case "Tasarım":
        return Color(0xffec4436);
      case "Oyun Geliştirme":
        return Color(0xffe36c2d);
      case "Yapay Zeka":
        return Color(0xffa93287);
      case "Siber Güvenlik":
        return Color(0xff517ec0);
      case "Blockchain":
        return Color(0xff2ba953);
      case "IOT":
        return Color(0xfffabc14);
      case "Keynote":
        return Color(0xff00b9f0);
      default:
        return Color(0xffc53b69);
    }
  }
}

enum Type { RED, BLUE, YELLOW }
