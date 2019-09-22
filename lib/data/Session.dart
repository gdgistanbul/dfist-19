import 'package:dfist19/data/SessionType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Session.g.dart';

@JsonSerializable()
class Session {
  String id;
  String title;
  String description;
  String startTime;
  String endTime;
  String track;
  List<SessionType> sessionTypes;
  String speakerId;
  String speakerName;

  Session();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
