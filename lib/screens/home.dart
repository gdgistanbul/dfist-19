import 'package:dfist19/screens/information.dart';
import 'package:dfist19/screens/sessions.dart';
import 'package:dfist19/widgets/rectangleButton.dart';
import 'package:dfist19/widgets/yourScheduleButton.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/screens/speakers.dart';
import 'package:flutter/services.dart';

import 'mySessions.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: new Image.asset(
            'assets/tickets.png',
            fit: BoxFit.fill,
          ),
        ),
        new Container(
          child: Padding(
            padding: EdgeInsets.only(top: 65.0, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 25,
                  ),
                  child: SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: IconButton(
                      icon: new Image.asset('assets/info.png'),
                      tooltip: 'Sesi 10 arttır',
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new InformationScreen()),
                          );
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 25,
                  ),
                  child: new SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Visibility(
                      visible: false,
                      child: IconButton(
                        icon: new Image.asset('assets/notifications.png'),
                        tooltip: 'Sesi 10 arttır',
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                    color: Colors.transparent,
                    child: YourScheduleButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new MySessionsScreen()),
                        );
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                        color: Colors.transparent,
                        child: RectangleButton(
                          key: UniqueKey(),
                          color: Color(0xffc53b69),
                          text1: "Etkinlik",
                          text2: "Takvimi",
                          width: 80,
                          height: 80,
                          image: 'assets/clock.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new SessionsScreen()),
                            );
                          },
                        )),
                    new Container(
                        color: Colors.transparent,
                        child: RectangleButton(
                          key: UniqueKey(),
                          color: Color(0xff6ab34d),
                          text1: "Tüm",
                          text2: "Konuşmacılar",
                          width: 70,
                          height: 70,
                          image: 'assets/empty.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SpeakerScreen()),
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    _pageController = new PageController();
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
    super.dispose();
    _pageController.dispose();
  }


}
