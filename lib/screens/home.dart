import 'package:dfist19/screens/information.dart';
import 'package:dfist19/utils/const.dart' as prefix0;
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';

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
        new Container(
          height: MediaQuery.of(context).size.height / 2.4,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: sessions == null ? 0 : sessions.length,
            itemBuilder: (BuildContext context, int index) {
              Map _sessions = sessions[index];

              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: SessionItem(
                  speaker: _sessions["name"],
                  title: _sessions["title"],
                  time: _sessions["time"],
                  track: _sessions["track"],
                  type: prefix0.Type.RED,
                ),
              );
            },
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
