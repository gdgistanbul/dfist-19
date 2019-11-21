
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';
import 'utils/const.dart';


void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
//    if (Platform.isIOS) {
//      OneSignal.shared.init(
//          "2fb1344c-c362-4064-a125-d4575b9aa73d",
//          iOSSettings: {
//            OSiOSSettings.autoPrompt: false,
//            OSiOSSettings.inAppLaunchUrl: true
//          }
//      );
//    }
//    if (Platform.isAndroid) {
//      OneSignal.shared.init("b4322560-686d-4adf-93a8-974185356f0a");
//    }
//    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    imageCache.clear();
  }

  @override
  void reassemble() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    super.reassemble();
  }
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: MainScreen(),
    );
  }
}
