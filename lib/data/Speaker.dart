import 'package:dfist19/data/Session.dart';
import 'package:dfist19/data/SocialMedia.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Speaker.g.dart';

@JsonSerializable()
class Speaker {
  String id = "";
  String name = "";
  String surname = "";
  String image = "";
  String bio = "";
  String title = "";
  String company = "";
  SocialMedia socialMedia;
  List<Session> sessions;


  Speaker();

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
