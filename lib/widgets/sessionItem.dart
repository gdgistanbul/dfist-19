import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/utils/API.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SessionItem extends StatefulWidget {
  final List<String> speaker;
  final String title;
  final String time;
  final String track;
  final String type;
  final GestureTapCallback onPressed;

  SessionItem({
    Key key,
    @required this.speaker,
    @required this.title,
    @required this.time,
    @required this.track,
    @required this.type,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _SessionItemState createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem> {
  bool isAnimated = false;
  SpeakerResponse data = new SpeakerResponse();

//  FluttieAnimationController shockedEmoji;
//
//  var instance = Fluttie();
//  prepareAnimation() async {
//
//    var emojiComposition =
//    await instance.loadAnimationFromAsset("assets/animations/anim.json");
//    shockedEmoji = await instance.prepareAnimation(emojiComposition);
//  }
  var buffer = new StringBuffer();

  _getSessionSpaker() async {
    buffer.clear();
    if(widget.speaker !=null && widget.speaker.isNotEmpty) {
      for (String speaker in widget.speaker)
        API.getSessionSpaker(speaker).then((response) {
          setState(() {
            data = response;
            buffer.write(data.speakers[0].data.name);
          if(widget.speaker.length >1 ) buffer.write(" ");
          });
        });
    }
  }

  initState() {
    super.initState();
    _getSessionSpaker();
  }

  @override
  dispose() {
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
                          visible: widget.speaker !=null && widget.speaker.length > 0,
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
                                      child: Text(buffer != null? buffer.toString() : "",
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
//                  Align(
//                    alignment: Alignment.bottomRight,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: GestureDetector(
//                          child: FluttieAnimation(
//                            shockedEmoji,
//                            size: Size(50, 43),
//                          ),
//                          onTap: () {
//                            if (!isAnimated) {
//                              shockedEmoji.start();
//                              isAnimated = true;
//                            } else {
//                              isAnimated = false;
//                              shockedEmoji.stopAndReset(rewind: true);
//                            }
//                          }),
//                    ),
//                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onPressed: widget.onPressed,
    );
  }

  _cardType(type) {
    switch (type) {
      case "Mobile Technologies":
        return "assets/red.png";
      case "Design":
        return "assets/red.png";
      case "Machine Learning & AI":
        return "assets/red.png";
      case "Cloud":
        return "assets/red.png";
      case "Web Technologies":
        return "assets/red.png";

      default:
        return "assets/red.png";
    }
  }

  _cardColor(type) {
    switch (type) {
      case "Mobile Technologies":
        return Color(0xffdc5144);
      case "Design":
        return Color(0xffdc5144);
      case "Cloud":
        return Color(0xff3196f6);
      case "Machine Learning & AI":
        return Color(0xff3196f6);
      case "Web Technologies":
        return Color(0xfff8bb15);
      default:
        return Color(0xffdc5144);
    }
  }
}
