import 'package:dfist19/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';



class SessionItem extends StatefulWidget {
  final String speaker;
  final String title;
  final String time;
  final String track;
  final Type type;
  final GestureTapCallback onPressed;
  var instance = Fluttie();
  FluttieAnimationController shockedEmoji;

  prepareAnimation() async {
    var emojiComposition =
    await instance.loadAnimationFromAsset("assets/animations/anim.json");
    shockedEmoji = await instance.prepareAnimation(emojiComposition);
  }

  SessionItem({
    Key key,
    @required this.speaker,
    @required this.shockedEmoji,
    @required this.instance,
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

  initState() {
    super.initState();
    widget.prepareAnimation();
  }

  @override
  dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor:Colors.transparent ,
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 147.0,
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
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child:
                          Image.asset(
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
                            text: new TextSpan(children: [
                              new TextSpan(
                                  text: widget.time,
                                  style: TextStyle(
                                      fontFamily: 'RedHatDisplay',
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal)),
                              new TextSpan(
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
                        Padding(
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

                        Align(
                          child: Container(
                            height: 65,
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      widget.speaker,
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
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          child: FluttieAnimation(widget.shockedEmoji,size: Size(50,43),),
                          onTap: () {
                            if(!isAnimated) {
                              widget.shockedEmoji.start();
                              isAnimated = true;
                            }else {
                              isAnimated = false;
                              widget.shockedEmoji.stopAndReset(rewind: true);
                            }
                          }),
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

  _cardType(type) {
    switch (type) {
      case Type.RED:
        return "assets/red.png";
      case Type.BLUE:
        return "assets/red.png";
      case Type.YELLOW:
        return "assets/red.png";
      default:
        return "assets/red.png";
    }
  }

  _cardColor(type) {
    switch (type) {
      case Type.RED:
        return Color(0xffdc5144);
      case Type.BLUE:
        return Color(0xff3196f6);
      case Type.YELLOW:
        return Color(0xfff8bb15);
    }
  }
}
