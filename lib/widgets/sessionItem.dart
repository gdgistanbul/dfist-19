import 'package:dfist19/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SessionItem extends StatefulWidget {
  final String speaker;
  final String title;
  final String time;
  final String track;
  final Type type;

  SessionItem({
    Key key,
    @required this.speaker,
    @required this.title,
    @required this.time,
    @required this.track,
    @required this.type,
  }) : super(key: key);

  @override
  _SessionItemState createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 147.0,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 3.0,
          color: _cardColor(widget.type),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 120,
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
                  new Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 16),
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
                              letterSpacing: 0,),
                            textAlign: TextAlign.left,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Align(
                    child: Container(
                      height: 139,
                      alignment: Alignment.bottomLeft,
                      child:  Padding(
                        padding: const EdgeInsets.only(
                            right:  16, left: 16, bottom: 16),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 26,
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
            ],
          ),
        ),
      ),
    );
  }

  _cardType(type) {
    switch (type) {
      case Type.RED:
        return "assets/design.png";
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