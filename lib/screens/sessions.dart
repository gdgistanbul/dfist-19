import 'package:dfist19/widgets/bottomSheet.dart';
import 'package:dfist19/widgets/bottomSheetItem.dart';
import 'package:dfist19/widgets/rectangleButton.dart';
import 'package:dfist19/widgets/searchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/widgets/bottomSheet.dart';
import 'package:dfist19/utils/const.dart';

class SessionsScreen extends StatelessWidget {
  FocusNode focus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Sessions",
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
                        EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: SearchWidget(focus1: focus),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
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
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Caretory",
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
                          bottomSheet();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      )
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
        body: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0),
          child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: sessions == null ? 0 : sessions.length,
              itemBuilder: (BuildContext context, int index) {
                Map _sessions = sessions[index];
                return SessionItem(
                  speaker: _sessions["name"],
                  title: _sessions["title"],
                  time: _sessions["time"],
                  track: _sessions["track"],
                  type: Type.RED,
                );
              },
            ),
          ),
        ),
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
//            height: 400,
            child:
//            bottomSheet(),
                new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(
                    24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Reset",
                          style: TextStyle(
                            fontFamily: 'RedHatDisplay',
                            color: Color(0xff333d47),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0,
                          )),
                      new Text("Categories",
                          style: TextStyle(
                            fontFamily: 'RedHatDisplay',
                            color: Color(0xff333d47),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0,
                          )),
                      Icon(
                        Icons.clear,
                        color: Color(0xff333d47),
                        size: 24,
                      ),
                    ],
                  ),
                ),
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
//                new bottomSheet(),
              ],
            ),
          );
        });
  }
}
