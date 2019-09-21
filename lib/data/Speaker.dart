import 'package:dfist19/data/Session.dart';
import 'package:firebase_database/firebase_database.dart';

class Speaker {
  String id = "";
  String name = "";
  String surname = "";
  String bio = "";
  String title = "";
  String company = "";
  String twitter = "";
  List<Session> sessions;


  Speaker.fromDataSnapshot(DataSnapshot data) {
    id = data.key;
    name = data.value['name'];
    surname = data.value['surname'];
    bio = data.value['bio'];
    title = data.value['title'];
    company = data.value['company'];
    twitter = data.value['twitter'];

    sessions = new List();

    Map<dynamic, dynamic> sessionsMap = data.value['sessions'];
    sessionsMap.forEach((key, value) {
      sessions.add(Session(key, value['title'], value['venue'], value['startTime'], value['endTime']));
    });
  }
}
