import 'dart:async';

import 'package:dfist19/data/Schedule.dart';
import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/data/TimeslotSessions.dart' as Session1;
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
import 'package:jiffy/jiffy.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsScreen extends StatefulWidget {

  @override
  _SessionsScreenState createState() => _SessionsScreenState();

  SessionsScreen();
}

class _SessionsScreenState extends State<SessionsScreen>
    with AutomaticKeepAliveClientMixin<SessionsScreen> {
  @override
  bool get wantKeepAlive => true;

  TextEditingController _controller = TextEditingController();

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

  _onChanged(String value) async {
    _newSessionss.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      _newSessionss = _sessions
          .where(((session) =>
              session.data.title.toLowerCase().contains(value.toLowerCase())))
          .toList();

      for (Speaker speaker in dataSpeaker.speakers) {
        if (speaker.data.name != null &&
            speaker.data.name.toLowerCase().contains(value.toLowerCase())) {
          for (Session session in _sessions) {
            if (session.data.speakers[0] != null &&
                session.data.speakers[0] == speaker.id)
              _newSessionss.add(session);
          }
        }
      }
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    setState(() {});
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    _getSF();
    await Future.delayed(Duration(milliseconds: 1000));
    _getSpeakers();
    API.getSessions().then((response) {
      setState(() {
        dataSessions = response;
      });
    });
    if (mounted) setState(() {});
    _refreshController.loadComplete();
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

  _addIdToSF(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favList", value);
  }

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList");
    setState(() {});
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
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    _controller.dispose();
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
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              }),
          title: Text("Etkinlik Takvimi",
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
                                "Salon",
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
                                "Kategori",
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
                            return _newSessionss.length == 0 ||
                                    _controller.text.isEmpty
                                ?
                            SmartRefresher(
                                    enablePullDown: true,
                                    controller: _refreshController,
                                    onRefresh: _onRefresh,
                                    onLoading: _onLoading,
                                    header: ClassicHeader(),

                                child:
                            ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: _timeslot.length,
                                    itemBuilder: (context, index1) {
                                      Timeslot _scheduleItem =
                                          _timeslot[index1];
                                      return Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                        height: 2,
                                                        decoration: new BoxDecoration(
                                                            color: Color(
                                                                    0xffcacdd4)
                                                                .withOpacity(
                                                                    0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2))),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0,
                                                            left: 8.0),
                                                    child: Text(
                                                      "${_scheduleItem.startTime}-${_scheduleItem.endTime}",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NunitoSans',
                                                        color:
                                                            Color(0xff333d47),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        height: 2,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                    0xffcacdd4)
                                                                .withOpacity(
                                                                    0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemCount: _timeslot[index1]
                                                .sessions
                                                .length,
                                            itemBuilder: (context, index2) {
                                              return Column(
                                                children: <Widget>[
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    itemCount:
                                                        _timeslot[index1]
                                                            .sessions[index2]
                                                            .items
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      Session _session =
                                                          new Session();
                                                      Session1.Session
                                                          _sessionItem =
                                                          _timeslot[index1]
                                                                  .sessions[
                                                              index2];
                                                      for (var i = 0;
                                                          i <
                                                              _sessions
                                                                  .length;
                                                          i++) {
                                                        if (_sessionItem
                                                                .items[index]
                                                                .toString() ==
                                                            _sessions[i].id) {
                                                          _session =
                                                              _sessions[i];
                                                        }
                                                      }
                                                      String starts;
                                                      String ends;
                                                      List<String> s =
                                                          _scheduleItem
                                                              .startTime
                                                              .split(":");
                                                      List<String> e =
                                                          _scheduleItem
                                                              .endTime
                                                              .split(":");
                                                      var startTime = Jiffy({
                                                        "hour":
                                                            int.parse(s[0]),
                                                        "minute":
                                                            int.parse(s[1])
                                                      });
                                                      var endTime = Jiffy({
                                                        "hour":
                                                            int.parse(e[0]),
                                                        "minute":
                                                            int.parse(e[1])
                                                      });
                                                      if (_timeslot[index1]
                                                              .sessions[
                                                                  index2]
                                                              .items
                                                              .length >
                                                          1) {
                                                        if (index == 0) {
                                                          var endTimeJ =
                                                              endTime
                                                                ..subtract(
                                                                    minutes:
                                                                        20);
                                                          starts = startTime
                                                              .format("HH:mm")
                                                              .toString();
                                                          ends = endTimeJ
                                                              .format("HH:mm")
                                                              .toString();
                                                        } else {
                                                          var startTimeJ =
                                                              startTime
                                                                ..add(
                                                                    minutes:
                                                                        20);
                                                          starts = startTimeJ
                                                              .format("HH:mm")
                                                              .toString();
                                                          ends = endTime
                                                              .format("HH:mm")
                                                              .toString();
                                                        }
                                                      } else {
                                                        starts = startTime
                                                            .format("HH:mm")
                                                            .toString();
                                                        ends = endTime
                                                            .format("HH:mm")
                                                            .toString();
                                                      }
                                                      return SessionItem(
                                                        key: ValueKey(_session
                                                            .data.title),
                                                        id: _session.id,
                                                        speaker: _session.data
                                                                    .speakers !=
                                                                null
                                                            ? _session
                                                                .data.speakers
                                                            : null,
                                                        title: _session
                                                            .data.title,
                                                        time:
                                                            '$starts - $ends',
                                                        track: _schedule[0]
                                                                    .data
                                                                    .tracks[
                                                                        index2]
                                                                    .title !=
                                                                null
                                                            ? _schedule[0]
                                                                .data
                                                                .tracks[
                                                                    index2]
                                                                .title
                                                            : "",
                                                        type: _session.data
                                                                    .tags !=
                                                                null
                                                            ? _session
                                                                .data.tags[0]
                                                            : "",
                                                        onTap:
                                                            (bool isLiked) {
                                                          return onLikeButtonTap(
                                                              isLiked,
                                                              _session.id);
                                                        },
                                                        isLiked: favList !=
                                                                null
                                                            ? favList
                                                                .contains(
                                                                    _session
                                                                        .id)
                                                            : false,
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => SessionDetail(
                                                                    onPressed:
                                                                        () {},
                                                                    session:
                                                                        _session,
                                                                    time:
                                                                        '$starts - $ends',
                                                                    track: _schedule[
                                                                            0]
                                                                        .data
                                                                        .tracks[
                                                                            index2]
                                                                        .title)),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                )
                                :
                            SmartRefresher(
                                enablePullDown: true,
                                controller: _refreshController,
                                onRefresh: _onRefresh,
                                onLoading: _onLoading,
                                header: ClassicHeader(),

                          child:
                            ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: _newSessionss.length,
                                    primary: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Session _session = _newSessionss[index];
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
                                            if (timeslot.sessions[i].items[j]
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
                                          key: ValueKey(_session.data.title),
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
                                              ? favList.contains(_session.id)
                                              : false,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SessionDetail(
                                                          onPressed: () {},
                                                          session: _session,
                                                          time: _time != null
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
            from : from,
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
  List<String> selectedReportList = List();
}
