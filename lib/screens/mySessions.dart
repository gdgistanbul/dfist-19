import 'dart:async';
import 'dart:html';

import 'package:dfist19/data/Schedule.dart';
import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/Speaker.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/SheduleResponse.dart';
import 'package:dfist19/data/Timeslot.dart';
import 'package:dfist19/screens/locale.dart' as Locale;
import 'package:dfist19/screens/sessionDetail.dart';
import 'package:dfist19/utils/API.dart';
import 'package:dfist19/utils/const.dart';
import 'package:dfist19/widgets/chip.dart';
import 'package:dfist19/widgets/sessionItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
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
                print(tag);
                print(session.data.title);
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
    print(isLiked.toString());
    if (favList != null) {
      if (!isLiked) {
        favList.add(id);
      } else {
        favList.remove(id);
      }
      print(favList.length);
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
    print(prefs.getStringList("favList")[0]);
    print(favList.length);
  }

  _getSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    favList = prefs.getStringList("favList");
    favList = Locale.localStorage.getList("favList") ;
    print(favList.length);
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
                    padding:
                        EdgeInsets.only(top: 16.0, left: 16.0, right: 10.0),
                    child: _search(context),
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
                                  fontFamily: 'RedHatDisplay',
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
                                  fontFamily: 'RedHatDisplay',
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
                                  if (session.id == sessionId) mySessions.add(session);
                                }
                              }
                            }
                            print(favList.length.toString());
                            return favList != null && favList.isNotEmpty? _newSessionss.isNotEmpty || _controller.text.isNotEmpty?
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
                                        timeslot
                                            .sessions[i].items.length;
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
                                    track: _track != null ? _track : " ",
                                    type: _session.data.tags != null
                                        ? _session.data.tags[0]
                                        : "",
                                    onTap: () {
                                      print("tapped");
                                      return onLikeButtonTap(
                                          true, _session.id);
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
                                                    track: _track != null
                                                        ? _track
                                                        : " ")),
                                      );
                                    });
                              },
                            ):
                             ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: mySessions.length,
                              primary: true,
                              itemBuilder: (BuildContext context, int index) {
                                Session _session = mySessions[index];
                                String _time;
                                String _track;
                                for (Timeslot timeslot in _timeslot) {
                                  for (var i = 0;
                                      i < timeslot.sessions.length;
                                      i++) {
                                    for (var j = 0;
                                        j < timeslot.sessions[i].items.length;
                                        j++) {
                                      if (timeslot.sessions[i].items[j]
                                              .toString() ==
                                          _session.id) {
                                        _time =
                                            "${timeslot.startTime}-${timeslot.endTime}";
                                        _track =
                                            _schedule[0].data.tracks[i].title;
                                      }
                                    }
                                  }
                                }
                                return SessionItem(
                                    key: ValueKey(_session.data.title),
                                    speaker: _session.data.speakers != null
                                        ? _session.data.speakers
                                        : null,
                                    title: _session.data.title,
                                    time: _time != null ? _time : " ",
                                    track: _track != null ? _track : " ",
                                    type: _session.data.tags != null
                                        ? _session.data.tags[0]
                                        : "",
                                    onTap: () {
                                      print("tapped");
                                      return onLikeButtonTap(
                                          true, _session.id);
                                    },
                                    isLiked: favList != null
                                        ? favList.contains(_session.id)
                                        : false,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SessionDetail(
                                                onPressed: () {},
                                                session: _session,
                                                time:
                                                    _time != null ? _time : " ",
                                                track: _track != null
                                                    ? _track
                                                    : " ")),
                                      );
                                    });
                              },
                            )
                                : Container(
                              child: Center(child: Text("Please add Favorite some Sessions to see here!!")),
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

  Widget _search(BuildContext context) {
    setState(() => context);
    context = this.context;
    return Column(
      children: <Widget>[
        Card(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          semanticContainer: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(color: Colors.grey[200], blurRadius: 10.0)
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: TextField(
              focusNode: focus,
              controller: _controller,
              onChanged: _onChanged,
              textInputAction: TextInputAction.done,
              autocorrect: true,
              onTap: () {
                FocusScope.of(context).requestFocus(focus);
                isVisible = true;
              },
              onEditingComplete: () {
                isVisible = false;
              },
              onSubmitted: (text) {
                FocusScope.of(context).requestFocus(new FocusNode());
                isVisible = false;
              },
              style: TextStyle(
                fontFamily: 'RedHatDisplay',
                color: Color(0xff80848b),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "Search..",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: new Visibility(
                  visible: focus.hasFocus,
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    onPressed: _controller.clear,
                  ),
                ),
                hintStyle: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  color: Color(0xff80848b),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }

  void _showModalSheet(BuildContext context, int from) {
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
          return new Container(
            height: 430,
            child: new Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 24.0, top: 14.0, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        child: new Text("Reset",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              color: Color(0xff333d47),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            )),
                        onPressed: () {
                          selectedReportList.clear();
                          _newSessionss.clear();
                          Navigator.pop(context);
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: new Text(from == 0 ? "Halls" : "Categories",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              color: Color(0xff333d47),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            )),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear,
                            color: Color(0xff333d47), size: 24),
                        onPressed: () {
                          Navigator.pop(context);
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: Container(
                    child: new GridView.builder(
                        itemCount: from == 0 ? halls.length : reportList.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3.5, crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Container(
                                child: Center(
                              child: MultiSelectChip(
                                colorList[index],
                                from == 0 ? halls[index] : reportList[index],
                                onSelectionChanged: (selectedList) {
                                  setState(() {
                                    selectedReportList.addAll(selectedList);
                                  });
                                },
                              ),
                            )),
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 8.0),
                      child: GestureDetector(
                        child: Card(
                          color: Color(0xff3196f6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0)),
                          child: Center(
                            child: new Text("Apply Filter",
                                style: TextStyle(
                                  fontFamily: 'RedHatDisplay',
                                  color: Color(0xffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                )),
                          ),
                        ),
                        onTap: () {
                          _controller.text = " ";
                          from == 0
                              ? _onFilteredByHalls(selectedReportList, context)
                              : _onFilteredByCategory(
                                  selectedReportList, context);
                          selectedReportList.clear();
                          Navigator.pop(context);
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<String> reportList = [
    "Robotics & assistant",
    "Mobile Technologies",
    "Web Technologies",
    "Cloud",
    "Machine Learning",
    "Firebase",
    "Design",
  ];

  List<String> halls = [
    "Bosphorus(Uniq Hall)",
    "Galata Tower(Glass Room)",
    "Maiden's Tower",
    "Hagia Sophia",
  ];

  List<Color> colorList = [
    Color(0xff7AD7E0),
    Color(0xff84E07A),
    Color(0xffFECC92),
    Color(0xff7A9DE0),
    Color(0xffE17F7F),
    Color(0xffFECC92),
    Color(0xffE07AB3),
  ];
  List<String> selectedReportList = List();
}
