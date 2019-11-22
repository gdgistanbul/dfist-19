//import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/data/Social.dart';
import 'package:dfist19/screens/sessionDetail.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/widgets/socialMediaList.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpeakerDetail extends StatefulWidget {
  final Speaker speaker;
  final String time;
  final String track;

  var namesGrowable = new List<String>();
  final GestureTapCallback onPressed;

  SpeakerDetail(
      {Key key,
      @required this.namesGrowable,
      @required this.onPressed,
      @required this.time,
      @required this.track,
      @required this.speaker})
      : super(key: key);

  @override
  _SpeakerDetailState createState() => _SpeakerDetailState();
}

class _SpeakerDetailState extends State<SpeakerDetail> {
  SessionsResponse data = new SessionsResponse();
  List<Session> sessions;

  _getSpeakerSessions() {
    API.getSpeakerSessions(widget.speaker.id).then((response) {
      setState(() {
        data = response;
        sessions = response.sessions;
      });
    });
  }

  List<String> favList;

  Future<bool> onLikeButtonTap(bool isLiked, String id) async {
    print(isLiked.toString());
    if (favList != null) {
      if (!isLiked) {
        favList.add(id);
      } else {
        favList.remove(id);
      }
      print(favList.length);
      _addIdToSF(favList);
    } else {
      favList = new List();
      favList.add(id);
      _addIdToSF(favList);
    }
    return !isLiked;
  }

  _addIdToSF(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favList", value);
    print(prefs.getStringList("favList")[0]);
    print(favList.length);
  }

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList");
    print(favList.length);
  }

  @override
  void initState() {
//    prepareAnimation();
    favList = new List();
    _getSF();
    _getSpeakerSessions();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//  prepareAnimation() async {
//    var emojiComposition =
//    await instance.loadAnimationFromAsset("assets/animations/anim.json");
//    shockedEmoji = await instance.prepareAnimation(emojiComposition);
//  }

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
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.only(top: 16),
//                  child: ClipRRect(
//                      borderRadius: new BorderRadius.circular(12),
//                      child: new CachedNetworkImage(
//                          imageUrl: widget.speaker.data.photoUrl,
//                          placeholder: (context, url) => SizedBox(
//                                child: CircularProgressIndicator(),
//                                height: 20.0,
//                                width: 20.0,
//                              ))),
//                ),
//              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: new Text(widget.speaker.data.name,
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              new Text(widget.speaker.data.title,
                  style: TextStyle(
                    fontFamily: 'RedHatDisplay',
                    color: Color(0xff333d47),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: new Text(widget.speaker.data.bio,
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      color: Color(0xff333d47),
                      fontSize: 16,
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
              Container(
                height: 50,
                child: new ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.speaker.data.socials.length,
                    itemBuilder: (BuildContext context, int index) {
                      Social social = widget.speaker.data.socials[index];
                      return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SocialMediaList(
                              socialMedia: social.link,
                              icon: "assets/${social.icon}.png"));
                    }),
              ),
              Visibility(
                visible: sessions == null ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: new Text("Sessions",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Color(0xff333d47),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              Center(
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: sessions == null
                      ? 0
                      : sessions.length > 0 ? sessions.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    Session _session = sessions[index];

                    return SessionItem(
                      onTap: () {
                        print("tapped");
                        return onLikeButtonTap(true, _session.id);
                      },
                      isLiked: favList != null
                          ? favList.contains(_session.id)
                          : false,
                      speaker: _session.data.speakers,
                      title: _session.data.title,
                      time: widget.time,
                      track: widget.track,
                      type: _session.data.tags[0],
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SessionDetail(
                                    onPressed: () {},
                                    session: _session,
                                    time: widget.time,
                                    track: widget.track,
                                  )),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
