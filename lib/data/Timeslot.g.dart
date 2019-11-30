// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Timeslot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeslot _$TimeslotFromJson(Map<String, dynamic> json) {
  return Timeslot()
    ..startTime = json['startTime'] as String
    ..sessions = (json['sessions'] as List)
        ?.map((e) =>
            e == null ? null : Session.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..endTime = json['endTime'] as String;
}

Map<String, dynamic> _$TimeslotToJson(Timeslot instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'sessions': instance.sessions,
      'endTime': instance.endTime
    };
