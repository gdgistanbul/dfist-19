import 'dart:async';

import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    var cnt = 0;
    if (widget.speaker != null && widget.speaker.isNotEmpty) {
      for (String speaker in widget.speaker)
        API.getSessionSpaker(speaker).then((response) {
          setState(() {
            data = response;
            buffer.write(data.speakers[0].data.name);
            if (widget.speaker.length - 1 == cnt)
              buffer.write(" ");
            else
              buffer.write(", ");
            cnt++;
          });
        });
    }
  }

  List<String> favList;

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList");
    print(favList.length);
  }


  @override
  initState() {
    super.initState();
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
          color: Constants.color(widget.type),
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
                            "${Constants.type(widget.type)}",
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
                                      fontFamily: 'NunitoSans',
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal)),
                              TextSpan(
                                  text: " // " + widget.track,
                                  style: TextStyle(
                                      fontFamily: 'NunitoSans',
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
                                fontFamily: 'NunitoSans',
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
                                      child: Container(
                                        width: 300,
                                        child: Text(
                                          buffer != null ? buffer.toString() : "",
                                          style: TextStyle(
                                              fontFamily: 'NunitoSans',
                                              color: Color(0xffffffff),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal),
                                          textAlign: TextAlign.left,
                                        ),
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
                  Padding(
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
                              isLiked ?  Icons.favorite: Icons.favorite_border,
                              color: isLiked ? Colors.white : Colors.white,
                              size: 30,
                            );
                          },
                        ),

//
//
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
}
