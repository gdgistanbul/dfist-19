import 'package:dfist19/screens/sessionDetail.dart';
import 'package:dfist19/screens/speakerDetail.dart';
import 'package:dfist19/widgets/searchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dfist19/utils/sessions.dart';
import 'package:dfist19/widgets/speakerItem.dart';

class SpeakerScreen extends StatefulWidget {
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  FocusNode focus = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
        bottom: PreferredSize(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 10.0),
                  child: SearchWidget(focus1: focus),
                ),
              ),
            ],
          ),
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            50.0,
          ),
        ),
      ),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: new GridView.builder(
              itemCount: sessions.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                Map _sessions = sessions[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                      child: Center(
                        child: SpeakerItem(
                          name: _sessions["name"],
                          img: "assets/tickets.png",
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new SpeakerDetail(
                                      name: _sessions["name"],
                                      description: "Lorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseylerLorem ipsum biseyler",
                                      img: "assets/tickets.png",
                                      title: "simyaci")),
                            );
                          },
                        ),
                      )),
                );
              }),
        ),
      ),
    );
  }
}