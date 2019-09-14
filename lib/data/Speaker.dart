import 'package:dfist19/data/Session.dart';
import 'package:firebase_database/firebase_database.dart';

class Speaker {
  String name;
  String surname;
  String bio;
  String title;
  String company;
  String twitter;
  Session session;

  Speaker.fromDb(DataSnapshot data) {
    name = data.value['name'];
  }
}
