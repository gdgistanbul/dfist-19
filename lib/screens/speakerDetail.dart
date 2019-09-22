import 'package:dfist19/data/SocialMedia.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/widgets/socialMediaList.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/utils/const.dart';

class SpeakerDetail extends StatefulWidget {
  final Speaker speaker;

  var namesGrowable = new List<String>();
  final GestureTapCallback onPressed;
  Map _sessions = sessions[0];

  SpeakerDetail(
      {Key key,
      @required this.namesGrowable,
      @required this.onPressed,
      @required this.speaker})
      : super(key: key);

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
                    child: Image.network(widget.speaker.image)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: new Text(widget.speaker.name + widget.speaker.surname,
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              new Text(widget.speaker.title,
                  style: TextStyle(
                    fontFamily: 'RedHatDisplay',
                    color: Color(0xff333d47),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: new Text(widget.speaker.bio,
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
              Visibility(
                visible: widget.speaker.socialMedia != null,
                child: Row(
                  children: <Widget>[
                    Visibility(
                      visible: widget.speaker.socialMedia.facebook != null,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia:
                                  widget.speaker.socialMedia.facebook != null
                                      ? widget.speaker.socialMedia.facebook
                                      : "",
                              icon: "assets/facebook.png")),
                    ),
                    Visibility(
                      visible: widget.speaker.socialMedia.twitter != null,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia:
                                  widget.speaker.socialMedia.twitter != null
                                      ? widget.speaker.socialMedia.twitter
                                      : "",
                              icon: "assets/twitter.png")),
                    ),
                    Visibility(
                      visible: widget.speaker.socialMedia.instagram != null,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia:
                                  widget.speaker.socialMedia.instagram != null
                                      ? widget.speaker.socialMedia.instagram
                                      : "",
                              icon: "assets/instagram.png")),
                    ),
                    Visibility(
                      visible: widget.speaker.socialMedia.linkedin != null,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia:
                                  widget.speaker.socialMedia.linkedin != null
                                      ? widget.speaker.socialMedia.linkedin
                                      : "",
                              icon: "assets/linkedin.png")),
                    ),
                    Visibility(
                      visible: widget.speaker.socialMedia.github != null,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia:
                                  widget.speaker.socialMedia.github != null
                                      ? widget.speaker.socialMedia.github
                                      : "",
                              icon: "assets/github.png")),
                    ),
                  ],
                ),
              ),
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
                  speaker: widget.speaker.name + widget.speaker.surname,
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
