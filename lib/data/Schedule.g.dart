// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule()
    ..id = json['id'] as String
    ..data = json['data'] == null
        ? null
        : SessionData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};
