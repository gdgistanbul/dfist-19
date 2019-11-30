import 'package:json_annotation/json_annotation.dart';
import 'Timeslot.dart';
import 'Track.dart';

part 'ScheduleData.g.dart';

@JsonSerializable()
class ScheduleData {
  String dateReadable;
  List<Timeslot> timeslots;
  String date;
  List<Track> tracks;

  ScheduleData();

  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDataToJson(this);
}
