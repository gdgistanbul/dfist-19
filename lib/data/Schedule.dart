import 'package:json_annotation/json_annotation.dart';
import 'SessionData.dart';

part 'Schedule.g.dart';

@JsonSerializable()
class Schedule {
  String id;
  SessionData data;

  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
