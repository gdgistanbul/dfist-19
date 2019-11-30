// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScheduleData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleData _$ScheduleDataFromJson(Map<String, dynamic> json) {
  return ScheduleData()
    ..dateReadable = json['dateReadable'] as String
    ..timeslots = (json['timeslots'] as List)
        ?.map((e) =>
            e == null ? null : Timeslot.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..date = json['date'] as String
    ..tracks = (json['tracks'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ScheduleDataToJson(ScheduleData instance) =>
    <String, dynamic>{
      'dateReadable': instance.dateReadable,
      'timeslots': instance.timeslots,
      'date': instance.date,
      'tracks': instance.tracks
    };
