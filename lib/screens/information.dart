import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    super.dispose();
  }
  final Event event = Event(
    title: 'DevFest Istanbul 2019',
    description: 'DevFest Istanbul 2019 at Uniq Hall',
    location: 'Huzur, Maslak Ayazağa Cd. No:4, 34396 Sarıyer/İstanbul',
    startDate: DateTime(2019, 11, 24, 09, 00),
    endDate: DateTime(2019, 11, 24, 19, 30),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bilgi",
            style: TextStyle(
              fontFamily: 'NunitoSans',
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
                    "GeekDay, GTÜ Bilgisayar Topluluğu tarafından her yıl düzenlenen, alanında uzman konuşmacılar ve Türkiye'nin her yerinden yüzlerce katılımcıdan oluşan, bilgi ve ??? bir etkinliktir.",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
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
                "Tarih & Zaman",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
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
                    text: "GeekDay, ",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "29 Şubat 2020, Cumartesi ",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "günü, saat ",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: "??:?? ile ??:??",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                new TextSpan(
                    text: " arasında düzenlenecektir.",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
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
                      "Takvimine Ekle",
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
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
                  Add2Calendar.addEvent2Cal(event);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 40),
              child: new Text(
                "Yer",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
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
                      image: ExactAssetImage('assets/gtu_kongre_merkezi.jpg'),
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
                        child: Text("Gebze Teknik Üniversitesi Kongre Merkezi",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontFamily: "NunitoSans",
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
                        "Google Haritalar'da Göster",
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
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
              padding: const EdgeInsets.only(right: 24, left: 24, top: 40),
              child: new Text(
                "Event Organizer",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
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
                      fontFamily: 'NunitoSans',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 40),
              child: new Text(
                "Social Media Accounts",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
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
              padding: const EdgeInsets.only(right: 24, left: 24, top: 40),
              child: new Text(
                "Event Sponsors",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                          height: 60.0, // height of the button
                          child: Image.asset("assets/ic_peak.png",
                              fit: BoxFit.fill)),
                      onTap: () {
                        _launchURL("https://peak.com/");
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0,top:16),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          child: Image.asset("assets/ic_google.png",
                              fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://developers.google.com/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0,top:16),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          child:
                          Image.asset("assets/ic_zeplin.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL("https://zeplin.io/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0,top:16),
                    child: GestureDetector(
                        child: Container(
                          height: 44.0, // height of the button
                          child: Image.asset("assets/ic_adesso.png",
                              fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.adesso.com.tr/en/index-3.jsp");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0,top:16),
                    child: GestureDetector(
                        child: Container(
                          height: 35.0, // height of the button
                          child:
                          Image.asset("assets/ic_pixery.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.pixerylabs.com/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0,top:16),
                    child: GestureDetector(
                        child: Container(
                          height: 80.0, // height of the button
                          child:
                          Image.asset("assets/ic_jetbrains.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://www.jetbrains.com/");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: GestureDetector(
                        child: Container(
                          height: 120.0, // height of the button
                          child:
                          Image.asset("assets/ic_gcloud.png", fit: BoxFit.fill),
                        ),
                        onTap: () {
                          _launchURL(
                              "https://cloud.google.com/");
                        }),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 16, bottom: 24),
              child: Center(
                child: new Text(
                    "DevFest are non-profit, community driven events. Without the sponsors we can not make it. Please support our sponsors.",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
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
