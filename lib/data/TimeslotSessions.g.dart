// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeslotSessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..items = (json['items'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SessionToJson(Session instance) =>
    <String, dynamic>{'items': instance.items};
