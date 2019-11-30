import 'package:json_annotation/json_annotation.dart';
import 'Schedule.dart';

part 'SheduleResponse.g.dart';

@JsonSerializable()
class ScheduleResponse {
  List<Schedule> schedule;

  ScheduleResponse();

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}
