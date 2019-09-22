import 'package:flutter/material.dart';
import 'package:fit_image/fit_image.dart';

class SpeakerItem extends StatefulWidget {
  final String img;
  final String name;
  final GestureTapCallback onPressed;


  SpeakerItem({
    Key key,
    @required this.img,
    @required this.name,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _SpeakerItemState createState() => _SpeakerItemState();
}

class _SpeakerItemState extends State<SpeakerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Align(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 3.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        child: new SizedBox(
                          child: new FitImage(
                            child: new Image.network(widget.img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Container(
                          height: 52.0,
                          color: Color(0xffcc333d47),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 16, right: 16),
                            child: Text(
                              "${widget.name}",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
