import 'package:fit_image/fit_image.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String text1;
  final String text2;
  final double height;
  final double width;
  final Color color;
  final String image;
  final GestureTapCallback onPressed;


  RectangleButton({
    Key key,
    @required this.text1,
    @required this.text2,
    @required this.height,
    @required this.width,
    @required this.color,
    @required this.image,
    @required this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor:Colors.transparent ,
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 144.0,
        width: MediaQuery.of(context).size.width / 2.35,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    color: color,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 11, top: 11, left: 16),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                text1,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NunitoSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                    letterSpacing: 0),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                text2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NunitoSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                    letterSpacing: 0),
                                textAlign: TextAlign.left,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 28.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0, bottom: 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(11),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
                      child: Container(
                        width: width,
                        height: height,
                        child: new SizedBox(
                          child: new FitImage(
                            child: new Image.asset(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
