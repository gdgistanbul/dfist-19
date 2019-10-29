// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..id = json['id'] as String
    ..data = json['data'] == null
        ? null
        : SessionData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SessionToJson(Session instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};
