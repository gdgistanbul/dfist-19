import 'package:fit_image/fit_image.dart';
import 'package:flutter/material.dart';

class YourScheduleButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  YourScheduleButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor:Colors.transparent ,
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
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
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    color: Color(0xffeb8b27),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        height: 70,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Takvimim ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NunitoSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0,
                                  letterSpacing: 0),
                              textAlign: TextAlign.left,
                            ),
                            new Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 7.5),
                  child: Container(
                    width: 84,
                    height: 86,
                    child: new SizedBox(
                      child: new FitImage(
                        child: new Image.asset('assets/schedule.png'),
                        fit: BoxFit.cover,
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
