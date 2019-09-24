import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/screens/speakerDetail.dart';
import 'package:dfist19/widgets/speakerItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

bool isAndorid = Platform.isAndroid;

class SessionDetail extends StatefulWidget {
  final Session session;
  final GestureTapCallback onPressed;

  SessionDetail({
    Key key,
    @required this.session,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _SessionDetailState createState() => _SessionDetailState();
}

class _SessionDetailState extends State<SessionDetail> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference speakerRef;

  Speaker speaker;

  @override
  void initState() {
    super.initState();
    database = FirebaseDatabase.instance;
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    speakerRef =
        database.reference().child('speakers/${widget.session.speakerId}');
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: new SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: isAndorid ? 116 : 130,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: new Text(widget.session.description,
                                  style: TextStyle(
                                    fontFamily: 'RedHatDisplay',
                                    color: Color(0xff333d47),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height / 11,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Card(
                                  color: Color(0xff3196f6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Center(
                                    child: new Text("Add Your Schedule",
                                        style: TextStyle(
                                          fontFamily: 'RedHatDisplay',
                                          color: Color(0xffffffff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: new Text("Speaker",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xff333d47),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          speaker == null
                              ? Container()
                              : Container(
                                  height: 180,
                                  width: 180,
                                  child: Center(
                                    child: SpeakerItem(
                                      name:
                                          "${speaker.name}  ${speaker.surname}",
                                      img: speaker.image,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new SpeakerDetail(
                                                      speaker: speaker)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipPath(
                  child: Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffdc5144),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/red.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  clipper: BottomWaveClipper(),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Container(
                height: 70,
                child: AppBar(
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  title: new Text("Session Detail",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      )),
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(isAndorid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        tooltip:
                            MaterialLocalizations.of(context).backButtonTooltip,
                      );
                    },
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: SizedBox(
                    height: isAndorid
                        ? MediaQuery.of(context).size.height / 60
                        : 20,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 80.0, left: 24.0, right: 24.0),
                    child: new Text(widget.session.title,
                        style: TextStyle(
                          fontFamily: 'RedHatDisplay',
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, top: 16.0, bottom: 16.0),
                    child: RichText(
                      text: new TextSpan(children: [
                        new TextSpan(
                            text: widget.session.startTime,
                            style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal)),
                        new TextSpan(
                            text: " // " + widget.session.track,
                            style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal)),
                      ]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _getData() {
    speakerRef.once().then((DataSnapshot snapshot) {
      setState(() {
        speaker = new Speaker.fromJson(jsonDecode(jsonEncode(snapshot.value)));
      });
    });
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(
        size.width / 2, isAndorid ? size.height - 150 : size.height - 140);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
