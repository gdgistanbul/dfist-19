import 'dart:async';

import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/utils/API.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionItem extends StatefulWidget {
  final List<String> speaker;
  final String title;
  final String id;
  final String time;
  final String track;
  final String type;
  final GestureTapCallback onPressed;
  final LikeButtonTapCallback onTap;
  final bool isLiked;
  final bool likeVisible;

  SessionItem({
    Key key,
    @required this.id,
    @required this.speaker,
    @required this.title,
    @required this.time,
    @required this.track,
    @required this.type,
    @required this.onPressed,
    @required this.onTap,
    @required this.isLiked,
    @required this.likeVisible,
  }) : super(key: key);

  @override
  _SessionItemState createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem>
    with AutomaticKeepAliveClientMixin<SessionItem> {
  @override
  bool get wantKeepAlive => true;

  bool isAnimated = false;
  SpeakerResponse data = new SpeakerResponse();

  var buffer = new StringBuffer();

  _getSessionSpaker() async {
    buffer.clear();
    if (widget.speaker != null && widget.speaker.isNotEmpty) {
      for (String speaker in widget.speaker)
        API.getSessionSpaker(speaker).then((response) {
          setState(() {
            data = response;
            buffer.write(data.speakers[0].data.name);
            if (widget.speaker.length > 1) buffer.write(" ");
          });
        });
    }
  }

  List<String> favList;

  _addIdToSF(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favList", value);
    print(prefs.getStringList("favList").length);
    print(favList.length);
  }

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList");
    print(favList.length);
  }

//  FluttieAnimationController shockedEmoji;
//
//  prepareAnimation() async {
//    bool canBeUsed = await Fluttie.isAvailable();
//    if (!canBeUsed) {
//      print("Animations are not supported on this platform");
//      return;
//    }
//    var instance = Fluttie();
//    var emojiComposition =
//        await instance.loadAnimationFromAsset("assets/animations/anim.json");
//    shockedEmoji = await instance.prepareAnimation(emojiComposition);
//  }

  @override
  initState() {
    super.initState();
//    prepareAnimation();
    _getSessionSpaker();
    favList = new List();
    _getSF();
  }

  @override
  dispose() {
    buffer.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() => context);
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 177.0,
        width: MediaQuery.of(context).size.width / 1.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 3.0,
          color: _cardColor(widget.type),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "${_cardType(widget.type)}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: widget.time,
                                  style: TextStyle(
                                      fontFamily: 'RedHatDisplay',
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal)),
                              TextSpan(
                                  text: " // " + widget.track,
                                  style: TextStyle(
                                      fontFamily: 'RedHatDisplay',
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal)),
                            ]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 16),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.speaker != null &&
                              widget.speaker.length > 0,
                          child: Align(
                            child: Container(
                              height: 55,
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, left: 16, bottom: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 16,
                                      child: Image.asset(
                                        "${"assets/people.png"}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        buffer != null ? buffer.toString() : "",
                                        style: TextStyle(
                                            fontFamily: 'RedHatDisplay',
                                            color: Color(0xffffffff),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.likeVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: LikeButton(
                              onTap: widget.onTap,
                            isLiked: widget.isLiked,
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked ? Colors.red : Colors.grey,
                                size: 30,
                              );
                            },
                          ),

//
//
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onPressed: widget.onPressed,
    );
  }



//  onLikeButtonTap(bool isLiked, String id) async {
//    print(id);
//    print("tapped");
//    print(isLiked.toString());
//
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    if (prefs.getStringList("favList") != null) {
//      if(isLiked){
//        prefs.getStringList("favList").add(id);
//      }else{
//        prefs.getStringList("favList").remove(id);
//      }
//    } else {
//      favList = new List();
//      favList.add(id);
//      print(favList.length);
//      prefs.setStringList("favList", favList);
//    }
////
////    if (favList.contains(id)) {
////      favList.remove(id);
////      _addIdToSF(favList);
////    } else {
////      favList.add(id);
////      print(id);
////      _addIdToSF(favList);
////    }
//  }

  _cardType(type) {
    switch (type) {
      case "Mobile Technologies":
        return "assets/red.png";
      case "Flutter":
        return "assets/red.png";
      case "Design":
        return "assets/red.png";
      case "Machine Learning & AI":
        return "assets/cloud.png";
      case "Machine Learning & Ai":
        return "assets/cloud.png";
      case "Cloud":
        return "assets/cloud.png";
      case "Web Technologies":
        return "assets/web.png";
      case "Robotics & assistant":
        return "assets/red.png";
      case "Firebase":
        return "assets/web.png";
      default:
        return "assets/red.png";
    }
  }

  _cardColor(type) {
    switch (type) {
      case "Mobile Technologies":
        return Color(0xff84E07A);
      case "Flutter":
        return Color(0xff84E07A);
      case "Design":
        return Color(0xffE07AB3);
      case "Cloud":
        return Color(0xff7A9DE0);
      case "Machine Learning & AI":
        return Color(0xffE17F7F);
      case "Machine Learning & Ai":
        return Color(0xffE17F7F);
      case "Web Technologies":
        return Color(0xffFECC92);
      case "Robotics & assistant":
        return Color(0xff7AD7E0);
      case "Firebase":
        return Color(0xffFECC92);
      default:
        return Color(0xffF1823B);
    }
  }
}
