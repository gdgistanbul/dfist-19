import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/widgets/socialMediaList.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/utils/const.dart';

class SpeakerDetail extends StatefulWidget {
  final String img;
  final String name;
  final String title;
  final String description;

//  var session = new Session();
  var namesGrowable = new List<String>();
  final GestureTapCallback onPressed;
  Map _sessions = sessions[0];

  SpeakerDetail({
    Key key,
    @required this.img,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.namesGrowable,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _SpeakerDetailState createState() => _SpeakerDetailState();
}

class _SpeakerDetailState extends State<SpeakerDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.namesGrowable = new List<String>();
    widget.namesGrowable.add("https://www.twitter.com/GDGIstanbul/");
    widget.namesGrowable.add("https://www.facebook.com/GDGIstanbul/");
    widget.namesGrowable.add("https://www.instagram.com/gdgistanbul/?hl=tr");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Speaker Detail",
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
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ClipRRect(
                    borderRadius: new BorderRadius.circular(12),
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: new Text(widget.name,
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              new Text(widget.title,
                  style: TextStyle(
                    fontFamily: 'RedHatDisplay',
                    color: Color(0xff333d47),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: new Text(widget.description,
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Visibility(
                visible: widget.namesGrowable != null
                    ? widget.namesGrowable.length > 2
                    : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: new Text("Social Media Accounts",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Color(0xff0f3649),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SocialMediaList(linkList: widget.namesGrowable)),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: new Text("Sessions",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Center(
                child: SessionItem(
                  speaker: widget.name,
                  title: widget._sessions["name"],
                  time: widget._sessions["time"],
                  track: widget._sessions["track"],
                  type: Type.RED,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
