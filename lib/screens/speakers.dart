import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/widgets/speakerItem.dart';

class SpeakerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Speakers",
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
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: sessions == null ? 0 : sessions.length,
          itemBuilder: (BuildContext context, int index) {
            Map _sessions = sessions[index];

            return Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: SpeakerItem(
                name: _sessions["name"],
                img: "assets/tickets.png",
              ),
            );
          },
        ),
      ),
    );
  }
}
