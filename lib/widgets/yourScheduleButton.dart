import 'package:fit_image/fit_image.dart';
import 'package:flutter/material.dart';

class YourScheduleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                    color: Color(0xfffd8369),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 11, top: 11, left: 16),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Your Schedule",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "RedHatDisplay",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0,
                            letterSpacing: 0),
                            textAlign: TextAlign.left,
                          ),
                          new IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 28,
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
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
                  padding: const EdgeInsets.only(right: 3.0, bottom: 3.0),
                  child: Container(
                    width: 84,
                    height: 86,
                    child: new SizedBox(
                      child: new FitImage(
                        child: new Image.asset('assets/cat.png'),
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
    );
  }
}
