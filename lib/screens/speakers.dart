import 'package:dfist19/data/Schedule.dart';
import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/SheduleResponse.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/data/Timeslot.dart';
import 'package:dfist19/screens/speakerDetail.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/widgets/searchWidget.dart';
import 'package:dfist19/widgets/speakerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SpeakerScreen extends StatefulWidget {
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen>with AutomaticKeepAliveClientMixin<SpeakerScreen> {

  @override
  bool get wantKeepAlive => true;

  final FocusNode focus = new FocusNode();
  TextEditingController controller = TextEditingController();
  bool isVisible = false;

  SpeakerResponse data = new SpeakerResponse();
  List<Speaker> speakers;
  List<Speaker> _newSpeakers;
  SessionsResponse dataSessions = new SessionsResponse();
  ScheduleResponse dataSchedule = new ScheduleResponse();
  List<Session> _sessions;
  List<Schedule> _schedule;
  List<Timeslot> _timeslot;

  _getSessions() {
    API.getSessions().then((response) {
      setState(() {
        dataSessions = response;
        _sessions = response.sessions;
      });
    });
  }

  _getSpeakers() {
    API.getSpeakers().then((response) {
      setState(() {
        data = response;
        speakers = response.speakers;
      });
    });
  }

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    _getSpeakers();
    _getSessions();
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }


  _getSchedule() {
    API.getSchedule().then((response) {
      setState(() {
        dataSchedule = response;
        _schedule = response.schedule;
        _timeslot = response.schedule[0].data.timeslots;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.isVisible;
    this.focus.addListener(() {
      if (focus.hasFocus) {
        isVisible = false;
      }
    });
    _getSpeakers();
    _getSessions();
    _getSchedule();
    speakers = new List();
    _sessions = new List();
    _timeslot = new List();
    _schedule = new List();
    _newSpeakers = new List();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    controller.dispose();
    super.dispose();
  }

  _onChanged(String value) async {
    _newSpeakers.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      _newSpeakers = speakers
          .where(((speaker) =>
              speaker.data.name.toLowerCase().contains(value.toLowerCase())))
          .toList();
    });
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
                  child: SearchWidget(
                    onChanged: _onChanged,
                    controller: controller,
                    focus1: focus,
                  ),
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
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12),
          child: _newSpeakers.length == 0 || controller.text.isEmpty
              ?
          SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              header: ClassicHeader(),

              child:
          GridView.builder(
                  itemCount: speakers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    Speaker speaker = speakers[index];
                    String _time;
                    String _track;
                    for (Timeslot timeslot in _timeslot) {
                      for (var i = 0; i < timeslot.sessions.length; i++) {
                        for (var j = 0;
                            j < timeslot.sessions[i].items.length;
                            j++) {
                          for (var k = 0; k < _sessions.length; k++) {
                            if (timeslot.sessions[i].items[j].toString() ==
                                _sessions[k].id) {
                              _time =
                                  "${timeslot.startTime}-${timeslot.endTime}";
                              _track = _schedule[0].data.tracks[i].title;
                            }
                          }
                        }
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                          child: Center(
                        child: SpeakerItem(
                          name: "${speaker.data.name}",
                          img: speaker.data.photoUrl,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new SpeakerDetail(
                                      speaker: speaker,
                                      time: _time != null ? _time : " ",
                                      track: _track != null ? _track : " ")),
                            );
                          },
                        ),
                      )),
                    );
                  })
          )
              :
    SmartRefresher(
    enablePullDown: true,
    controller: _refreshController,
    onRefresh: _onRefresh,
    onLoading: _onLoading,
    header: ClassicHeader(),
    child:
          GridView.builder(
                  itemCount: _newSpeakers.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    Speaker speaker = _newSpeakers[index];
                    String _time;
                    String _track;
                    for (Timeslot timeslot in _timeslot) {
                      for (var i = 0; i < timeslot.sessions.length; i++) {
                        for (var j = 0;
                            j < timeslot.sessions[i].items.length;
                            j++) {
                          for (var k = 0; k < _sessions.length; k++) {
                            if (timeslot.sessions[i].items[j].toString() ==
                                _sessions[k].id) {
                              _time =
                                  "${timeslot.startTime}-${timeslot.endTime}";
                              _track = _schedule[0].data.tracks[i].title;
                            }
                          }
                        }
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                          child: Center(
                        child: new SpeakerItem(
                          name: "${speaker.data.name}",
                          img: speaker.data.photoUrl,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new SpeakerDetail(
                                      speaker: speaker,
                                      time: _time != null ? _time : " ",
                                      track: _track != null ? _track : " ")),
                            );
                          },
                        ),
                      )),
                    );
                  })),
        ),
      ),
    );
  }

}
