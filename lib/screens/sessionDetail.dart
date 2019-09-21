import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/widgets/socialMediaList.dart';
import 'package:dfist19/widgets/speakerItem.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/utils/const.dart';

class SessionDetail extends StatefulWidget {
  final String img;
  final String name;
  final String title;
  final String description;
  final String speaker;
  final String time;
  final String track;

//  var session = new Session();
  final GestureTapCallback onPressed;
  Map _sessions = sessions[0];

  SessionDetail({
    Key key,
    @required this.img,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.onPressed,
    @required this.speaker,
    @required this.time,
    @required this.track,
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
              padding: const EdgeInsets.only(top: 116.0),
              child: new SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:100.0),
                            child: new Text(
                                "Let's assume you have a product that is already working. This product has different problems or aspects that it has accomplished quite well.But at the end of the day, you needed to redesign your existing product because of the aesthetic concerns, or because of the new needs that arise over time. How will you manage this process?Should you change the current product in one go? Or is it better to spread this process over time? What will your users like in your new design? Is there really such an action needed? In this talk, let's learn how to manage a redesign process!Let's assume you have a product that is already working. This product has different problems or aspects that it has accomplished quite well.But at the end of the day, you needed to redesign your existing product because of the aesthetic concerns, or because of the new needs that arise over time. How will you manage this process?Should you change the current product in one go? Or is it better to spread this process over time? What will your users like in your new design? Is there really such an action needed? In this talk, let's learn how to manage a redesign process!Let's assume you have a product that is already working. This product has different problems or aspects that it has accomplished quite well.But at the end of the day, you needed to redesign your existing product because of the aesthetic concerns, or because of the new needs that arise over time. How will you manage this process?Should you change the current product in one go? Or is it better to spread this process over time? What will your users like in your new design? Is there really such an action needed? In this talk, let's learn how to manage a redesign process!Let's assume you have a product that is already working. This product has different problems or aspects that it has accomplished quite well.But at the end of the day, you needed to redesign your existing product because of the aesthetic concerns, or because of the new needs that arise over time. How will you manage this process?Should you change the current product in one go? Or is it better to spread this process over time? What will your users like in your new design? Is there really such an action needed? In this talk, let's learn how to manage a redesign process!",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xff333d47),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
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
                                name: widget.name,
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
                    height: MediaQuery.of(context).size.height / 2.1,
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
                  padding: const EdgeInsets.only(top: 80.0, left: 24.0, right: 24.0),
                  child: new Text(
                      "How to Understand Product Design Process as a Developer?",
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
                    padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                    child: RichText(
                      text: new TextSpan(children: [
                        new TextSpan(
                            text: widget.time,
                            style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal)),
                        new TextSpan(
                            text: " //" + widget.track,
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
    path.lineTo(size.width / 2, size.height - 150);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
