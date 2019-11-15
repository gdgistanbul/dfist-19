import 'package:dfist19/data/ScheduleData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Schedule.g.dart';

@JsonSerializable()
class Schedule {
  String id;
  ScheduleData data;

  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
