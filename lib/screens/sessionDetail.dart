import 'package:dfist19/data/Session.dart';
import 'package:dfist19/widgets/speakerItem.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;


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
  @override
  void initState() {
    super.initState();
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
                                    fontSize: 14,
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
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 8.0),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: new Text("Speaker",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xff333d47),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          Container(
                            height: 144.0,
                            width: 144.0,
                            child: Center(
                              child: SpeakerItem(
                                name: widget.session.speakerName,
                                img: "assets/tickets.png",
                                onPressed: () {},
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
//                    isAndorid
//                        ? MediaQuery.of(context).size.height / 2.1
//                        : MediaQuery.of(context).size.height / 2.5,
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
            Container(
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
                      icon: const Icon(Icons.arrow_back),
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
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 24.0, right: 24.0),
                  child: new Text(widget.session.title,
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
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
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal)),
                        new TextSpan(
                            text: " //" + widget.session.track,
                            style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
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
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width / 2, isAndorid? size.height - 150: size.height - 140);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
