import 'package:dfist19/widgets/searchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:dfist19/utils/const.dart';

class SessionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();
    Color color = Colors.white;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sessions",
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
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Container(
              child: SearchWidget(),
              decoration: new BoxDecoration(boxShadow: [
                new BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ]),
            ),
          ),
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            60.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 24.0, left: 24.0),
        child: new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: sessions == null ? 0 : sessions.length,
            itemBuilder: (BuildContext context, int index) {
              Map _sessions = sessions[index];

              return SessionItem(
                speaker: _sessions["name"],
                title: _sessions["title"],
                time: _sessions["time"],
                track: _sessions["track"],
                type: Type.RED,
              );
            },
          ),
        ),
      ),
    );
  }
}
