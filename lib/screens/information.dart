//import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Information",
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
      ),
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: Center(
                child: new Text(
                    "GDG DevFests are large, community-run events that can offer speaker sessions across multiple product areas, all-day hack-a-thons, code labs, and more. ",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: new Text(
                "Date & Time",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff333d47),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: RichText(
                  text: new TextSpan(children: [
                new TextSpan(
                    text: "DevFest Istanbul 2019 will be held on ",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "24th of November, Sunday ",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "between ",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "09:00 to 19:00",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: GestureDetector(
                child: new Container(
                  height: 53,
                  decoration: new BoxDecoration(
                      color: Color(0xff3196f6),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: new Text(
                      "Add Your Calendar",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                onTap: () {
//                  Add2Calendar.addEvent2Cal(event);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: new Text(
                "Venue",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff333d47),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: Container(
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/uniq.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(color: Colors.grey[200], blurRadius: 10.0)
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                color: const Color(0xcc333d47)))),
                    PositionedDirectional(
                      top: 185,
                      start: 16,
                      child: Container(
                        height: 50,
                        child: Text("UNIQ HALL // UNIQ Istanbul",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontFamily: "RedHatDisplay",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0)),
                      ),
                    ),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: GestureDetector(
                  child: (new Container(
                    height: 53,
                    decoration: new BoxDecoration(
                        color: Color(0xff3196f6),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: new Text(
                        "Show on Google Maps",
                        style: TextStyle(
                          fontFamily: 'RedHatDisplay',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )),
                  onTap: () {
                    _launchURL("https://goo.gl/maps/E8N3kNeed2cUA6db8");
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: new Text(
                "Event Organizer",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff333d47),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: Container(
                width: 214,
                child: Image.asset(
                  "assets/gdg_istanbul_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: Center(
                child: new Text(
                    "Google Developers Groups (GDG) - are open and volunteer geek communities that create exciting projects and share experience about Google technologies with a passion.",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: new Text(
                "Social Media Accounts",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff333d47),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( left: 24.0,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                          height: 44.0, // height of the button
                          width: 44.0, // width of the button
                          child: Image.asset("assets/facebook.png",
                              fit: BoxFit.fill)),
                      onTap: () {
                        _launchURL("https://www.facebook.com/GDGIstanbul/");
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          width: 44.0, // width of the button
                          child: Image.asset("assets/instagram.png",
                          fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.instagram.com/gdgistanbul/?hl=tr");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          width: 44.0, // width of the button
                          child:
                          Image.asset("assets/twitter.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL("https://twitter.com/GDGIstanbul/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          width: 44.0, // width of the button
                          child: Image.asset("assets/linkedin.png",
                          fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.linkedin.com/company/2943205/admin/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          width: 44.0, // width of the button
                          child:
                          Image.asset("assets/youtube.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.youtube.com/channel/UCY0yxph6mFEfzvY4_6GYArg");
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: new Text(
                "Event Sponsors",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff333d47),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 16, bottom: 24),
              child: Center(
                child: new Text(
                    "DevFest are non-profit, community driven events. Without the sponsors we can not make it. Please support our sponsors.",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
