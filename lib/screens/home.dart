import 'package:dfist19/screens/information.dart';
import 'package:dfist19/widgets/yourScheduleButton.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/screens/sessions.dart';
import 'package:dfist19/screens/speakers.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

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
//        decoration: new BoxDecoration(
//          image: new DecorationImage(
//              image: new ExactAssetImage('assets/tickets.png'), fit: BoxFit.cover),
//        ),
          child: Padding(
            padding: EdgeInsets.only(top: 65.0, left: 16, right: 16),
            child: Row(
//            mainAxisSize: MainAxisSize.max,
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
                          _page++;
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
            padding: const EdgeInsets.all(16.0),
            child: new Container(
                color: Colors.transparent,
                child: YourScheduleButton()
//              MaterialButton(
//                color: Colors.redAccent,
//                child: Row(
//                  children: <Widget>[
//                    IconButton(
//                      icon: new Image.asset('assets/notifications.png'),
//                      onPressed: () {
//                        setState(() {});
//                      },
//                    ),
//                    Text("Sessions",
//                        style: TextStyle(
//                          fontFamily: 'RedHatDisplay',
//                          color: Colors.white,
//                          fontSize: 18,
//                          fontWeight: FontWeight.w700,
//                          fontStyle: FontStyle.normal,
//                          letterSpacing: 0,
//                        ))
//                  ],
//                ),
//                onPressed: () {
//                  setState(() {
//                    _page++;
//                    Navigator.push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (context) => new SpeakerScreen()),
//                    );
//                  });
//                },
//              ),
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
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
