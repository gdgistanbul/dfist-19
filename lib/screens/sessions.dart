import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/SessionData.dart';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/screens/sessionDetail.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/utils/const.dart';
import 'package:dfist19/widgets/bottomSheet.dart';
import 'package:dfist19/widgets/searchWidget.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class SessionsScreen extends StatefulWidget {
  final bool isSessions;

  @override
  _SessionsScreenState createState() => _SessionsScreenState();

  SessionsScreen(this.isSessions);
}

class _SessionsScreenState extends State<SessionsScreen> {
  FluttieAnimationController shockedEmoji;
  var instance = Fluttie();
  FocusNode focus = new FocusNode();

  SessionsResponse data = new SessionsResponse();
  List<Session> sessions;

  _getUsers() {
    API.getSessions().then((response) {
      setState(() {
        data = response;
        print("blaalsd" + data.sessions.toString());
        sessions = response.sessions;
      });
    });
  }

  @override
  void initState() {
    prepareAnimation();
    sessions = new List();
    _getUsers();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  prepareAnimation() async {
    var emojiComposition =
        await instance.loadAnimationFromAsset("assets/animations/anim.json");
    shockedEmoji = await instance.prepareAnimation(emojiComposition);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.isSessions ? "Sessions" : "Your Schedule",
              style: TextStyle(
                fontFamily: 'RedHatDisplay',
                color: Color(0xff333d47),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              )),
          elevation: 0.0,
          centerTitle: true,
          bottom: PreferredSize(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 16.0, left: 16.0, right: 10.0),
                    child: SearchWidget(focus1: focus),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Halls",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xff373a42),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff333d47),
                                size: 28.0,
                              ),
                            ],
                          ),
                          onPressed: () {
                            _showModalSheet(context);
                          }),
                      FlatButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Category",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xff373a42),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff333d47),
                                size: 28.0,
                              ),
                            ],
                          ),
                          onPressed: () {
                            _showModalSheet(context);
                          })
                    ],
                  ),
                ),
              ],
            ),
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              100.0,
            ),
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: new Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: sessions.length,
                itemBuilder: (BuildContext context, int index) {
                  SessionData _session = sessions[index].data;
                  return SessionItem(
                    shockedEmoji: shockedEmoji,
                    instance: instance,
                    speaker: _session.speakers[0],
                    title: _session.title,
                    time: _session.language,
                    track: _session.complexity,
                    type: Type.RED,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SessionDetail(
                                  onPressed: () {},
                                  session: _session,
                                )),
                      );
                    },
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        context: context,
        builder: (context) {
          return new Container(
            height: 430,
            child: new Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 24.0, top: 14.0, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        child: new Text("Reset",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              color: Color(0xff333d47),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: new Text("Categories",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              color: Color(0xff333d47),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            )),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear,
                            color: Color(0xff333d47), size: 24),
                        onPressed: () {
                          Navigator.pop(context);
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: BottomSheetList(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 8.0),
                      child: Card(
                        color: Color(0xff3196f6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        child: Center(
                          child: new Text("Apply Filter",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
