import 'package:json_annotation/json_annotation.dart';

import 'TimeslotSessions.dart';

part 'Timeslot.g.dart';

@JsonSerializable()
class Timeslot {
  String startTime;
  List<Session> sessions;
  String endTime;

  Timeslot();

  factory Timeslot.fromJson(Map<String, dynamic> json) =>
      _$TimeslotFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotToJson(this);
}
