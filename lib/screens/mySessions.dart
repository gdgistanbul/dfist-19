import 'dart:async';

import 'package:dfist19/data/Schedule.dart';
import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/SheduleResponse.dart';
import 'package:dfist19/data/Timeslot.dart';
import 'package:dfist19/screens/sessionDetail.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/utils/const.dart';
import 'package:dfist19/widgets/bottomSheetItem.dart';
import 'package:dfist19/widgets/searchWidget.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySessionsScreen extends StatefulWidget {
  @override
  _MySessionsScreenState createState() => _MySessionsScreenState();

  MySessionsScreen();
}

class _MySessionsScreenState extends State<MySessionsScreen>
    with AutomaticKeepAliveClientMixin<MySessionsScreen> {
  @override
  bool get wantKeepAlive => true;

  TextEditingController _controller = TextEditingController();
  List<String> selectedReportList = List();

  FocusNode focus = new FocusNode();
  bool isVisible = false;

  SessionsResponse dataSessions = new SessionsResponse();
  ScheduleResponse dataSchedule = new ScheduleResponse();
  SpeakerResponse dataSpeaker = new SpeakerResponse();
  List<Session> _sessions;
  List<Schedule> _schedule;
  List<Timeslot> _timeslot;
  List<Session> _newSessionss;
  List<Session> _newSessionsss;
  List<Session> mySessions;

  _onChanged(String value) async {
    _newSessionss.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      _newSessionss = mySessions
          .where(((session) =>
              session.data.title.toLowerCase().contains(value.toLowerCase())))
          .toList();

      for (Speaker speaker in dataSpeaker.speakers) {
        if (speaker.data.name != null &&
            speaker.data.name.toLowerCase().contains(value.toLowerCase())) {
          for (Session session in mySessions) {
            if (session.data.speakers[0] != null &&
                session.data.speakers[0] == speaker.id)
              _newSessionss.add(session);
          }
        }
      }
    });
  }

  _onChanged1() async {
    mySessions.clear();
    if (favList != null) {
      for (String sessionId in favList) {
        for (Session session in _sessions) {
          if (session.id == sessionId) mySessions.add(session);
        }
      }
    }
  }

  _getSpeakers() {
    API.getSpeakers().then((response) {
      setState(() {
        dataSpeaker = response;
      });
    });
  }

  _onFilteredByCategory(List<String> value, BuildContext context) async {
    _newSessionss = new List();
    _newSessionsss = new List();
    _newSessionss.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      for (String val in value) {
        for (Session session in _sessions) {
          if (session.data.tags != null) {
            for (String tag in session.data.tags) {
              if (tag.contains(val)) {
                _newSessionsss.add(session);
                _newSessionss = _newSessionsss;
              }
            }
          }
        }
      }
    });
  }

  Future<bool> onLikeButtonTap(bool isLiked, String id) async {
    if (favList != null) {
      if (!isLiked) {
        favList.add(id);
      } else {
        favList.remove(id);
      }
      _addIdToSF(favList);
    } else {
      favList = new List();
      favList.add(id);
      _addIdToSF(favList);
    }
    return !isLiked;
  }

  _onFilteredByHalls(List<String> value, BuildContext context) async {
    _newSessionss = new List();
    _newSessionsss = new List();
    _newSessionss.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      for (String val in value) {
        for (Session session in _sessions) {
          for (Timeslot timeslot in _timeslot) {
            for (var i = 0; i < timeslot.sessions.length; i++) {
              for (var j = 0; j < timeslot.sessions[i].items.length; j++) {
                if (timeslot.sessions[i].items[j].toString() == session.id) {
                  if (i == Constants.hall(val)) _newSessionss.add(session);
                }
              }
            }
          }
        }
      }
    });
  }

  List<String> favList;

  _addIdToSF(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favList", value);
  }

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList");
  }

  @override
  void initState() {
    this.isVisible;
    this.focus.addListener(() {
      if (focus.hasFocus) {
        isVisible = false;
      }
    });
    favList = new List();
    _getSF();
    _getSpeakers();
    _controller = new TextEditingController();
    _sessions = new List();
    _schedule = new List();
    _timeslot = new List();
    _newSessionss = new List();
    mySessions = new List();
    _onChanged1();
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() => context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Schedule",
              style: TextStyle(
                fontFamily: 'NunitoSans',
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
                    padding:
                        EdgeInsets.only(top: 16.0, left: 16.0, right: 10.0),
                    child: SearchWidget(
                      onChanged: _onChanged,
                      controller: _controller,
                      focus1: focus,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Halls",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  color: Color(0xff373a42),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff333d47),
                                size: 28.0,
                              ),
                            ],
                          ),
                          onPressed: () {
                            _showModalSheet(context, 0);
                          }),
                      FlatButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Category",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  color: Color(0xff373a42),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff333d47),
                                size: 28.0,
                              ),
                            ],
                          ),
                          onPressed: () {
                            _showModalSheet(context, 1);
                          })
                    ],
                  ),
                ),
              ],
            ),
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              100.0,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: FutureBuilder<ScheduleResponse>(
                future: API.getSchedule(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    dataSchedule = snapshot.data;
                    _schedule = dataSchedule.schedule;
                    _timeslot = _schedule[0].data.timeslots;
                    return FutureBuilder<SessionsResponse>(
                        future: API.getSessions(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            dataSessions = snapshot.data;
                            _sessions = dataSessions.sessions;
                            mySessions.clear();
                            if (favList != null) {
                              for (String sessionId in favList) {
                                for (Session session in _sessions) {
                                  if (session.id == sessionId)
                                    mySessions.add(session);
                                }
                              }
                            }
                            return favList != null && favList.isNotEmpty
                                ? _newSessionss.isNotEmpty ||
                                        _controller.text.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: _newSessionss.length,
                                        primary: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          Session _session =
                                              _newSessionss[index];
                                          String _time;
                                          String _track;
                                          for (Timeslot timeslot in _timeslot) {
                                            for (var i = 0;
                                                i < timeslot.sessions.length;
                                                i++) {
                                              for (var j = 0;
                                                  j <
                                                      timeslot.sessions[i].items
                                                          .length;
                                                  j++) {
                                                if (timeslot
                                                        .sessions[i].items[j]
                                                        .toString() ==
                                                    _session.id) {
                                                  _time =
                                                      "${timeslot.startTime}-${timeslot.endTime}";
                                                  _track = _schedule[0]
                                                      .data
                                                      .tracks[i]
                                                      .title;
                                                }
                                              }
                                            }
                                          }
                                          return SessionItem(
                                              key:
                                                  ValueKey(_session.data.title),
                                              speaker:
                                                  _session.data.speakers != null
                                                      ? _session.data.speakers
                                                      : null,
                                              title: _session.data.title,
                                              time: _time != null ? _time : " ",
                                              track:
                                                  _track != null ? _track : " ",
                                              type: _session.data.tags != null
                                                  ? _session.data.tags[0]
                                                  : "",
                                              onTap: (bool isLiked) {
                                                return onLikeButtonTap(
                                                    isLiked, _session.id);
                                              },
                                              isLiked: favList != null
                                                  ? favList
                                                      .contains(_session.id)
                                                  : false,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SessionDetail(
                                                              onPressed: () {},
                                                              session: _session,
                                                              time:
                                                                  _time != null
                                                                      ? _time
                                                                      : " ",
                                                              track:
                                                                  _track != null
                                                                      ? _track
                                                                      : " ")),
                                                );
                                              });
                                        },
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: mySessions.length,
                                        primary: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          Session _session = mySessions[index];
                                          String _time;
                                          String _track;
                                          for (Timeslot timeslot in _timeslot) {
                                            for (var i = 0;
                                                i < timeslot.sessions.length;
                                                i++) {
                                              for (var j = 0;
                                                  j <
                                                      timeslot.sessions[i].items
                                                          .length;
                                                  j++) {
                                                if (timeslot
                                                        .sessions[i].items[j]
                                                        .toString() ==
                                                    _session.id) {
                                                  _time =
                                                      "${timeslot.startTime}-${timeslot.endTime}";
                                                  _track = _schedule[0]
                                                      .data
                                                      .tracks[i]
                                                      .title;
                                                }
                                              }
                                            }
                                          }
                                          return SessionItem(
                                              key:
                                                  ValueKey(_session.data.title),
                                              speaker:
                                                  _session.data.speakers != null
                                                      ? _session.data.speakers
                                                      : null,
                                              title: _session.data.title,
                                              time: _time != null ? _time : " ",
                                              track:
                                                  _track != null ? _track : " ",
                                              type: _session.data.tags != null
                                                  ? _session.data.tags[0]
                                                  : "",
                                              onTap: (bool isLiked) {
                                                return onLikeButtonTap(
                                                    isLiked, _session.id);
                                              },
                                              isLiked: favList != null
                                                  ? favList
                                                      .contains(_session.id)
                                                  : false,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SessionDetail(
                                                              onPressed: () {},
                                                              session: _session,
                                                              time:
                                                                  _time != null
                                                                      ? _time
                                                                      : " ",
                                                              track:
                                                                  _track != null
                                                                      ? _track
                                                                      : " ")),
                                                );
                                              });
                                        },
                                      )
                                : Container(
                                    child: Center(
                                        child: Text(
                                            "Please add Favorite some Sessions to see here!!")),
                                  );
                            //
                          }
                        });
                  }
                }),
          ),
        ),
      ),
    );
  }

  _showModalSheet(BuildContext context, int from) {
    setState(() => context);
    context = this.context;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        context: context,
        builder: (context) {
          return new BottomSheetItem(
            from: from,
            onPressed: () {
              _controller.text = " ";
              from == 1
                  ? _onFilteredByCategory(selectedReportList, context)
                  : _onFilteredByHalls(selectedReportList, context);
              selectedReportList.clear();
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            onResetPressed: () {
              selectedReportList.clear();
              _newSessionss.clear();
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            onSelectionChanged: (selectedList) {
              setState(() {
                selectedReportList.addAll(selectedList);
              });
            },
          );
        });
  }
}
