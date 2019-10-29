import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/screens/information.dart';
import 'package:dfist19/screens/sessions.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/widgets/rectangleButton.dart';
import 'package:dfist19/widgets/yourScheduleButton.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/screens/speakers.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  SpeakerResponse data = new SpeakerResponse();
  SessionsResponse sessions = new SessionsResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
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
                      tooltip: 'Increase volume by 10',
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
                Image(
                  image: new AssetImage('assets/logo.png'),
                  width: 170,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 25,
                  ),
                  child: new SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: IconButton(
                      icon: new Image.asset('assets/notifications.png'),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        setState(() {});
                      },
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
                              builder: (context) => new SessionsScreen(false)),
                        );
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                        color: Colors.transparent,
                        child: RectangleButton(
                          key: null,
                          color: Color(0xff74d5de),
                          text1: "Event",
                          text2: "Schedule",
                          width: 80,
                          height: 90,
                          image: 'assets/newspaper.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new SessionsScreen(true)),
                            );
                          },
                        )),
                    new Container(
                        color: Colors.transparent,
                        child: RectangleButton(
                          key: null,
                          color: Color(0xfffecc92),
                          text1: "All",
                          text2: "Speakers",
                          width: 60,
                          height: 90,
                          image: 'assets/question.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>  SpeakerScreen()),
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

  _getSpeakers() {
    API.getSpeakers().then((response) {
      setState(() {
        data = response;
      });
    });
  }

  _getSessions() {
    API.getSessions().then((response) {
      setState(() {
        sessions = response;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    _getSessions();
    _getSpeakers();
    _pageController = PageController();
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

  void onPageChanged(int page) {
    setState(() {});
  }
}
