// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..startTime = json['startTime'] as String
    ..endTime = json['endTime'] as String
    ..track = json['track'] as String
    ..sessionTypes = (json['sessionTypes'] as List)
        ?.map((e) =>
            e == null ? null : SessionType.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..speakerId = json['speakerId'] as String
    ..speakerName = json['speakerName'] as String;
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'track': instance.track,
      'sessionTypes': instance.sessionTypes,
      'speakerId': instance.speakerId,
      'speakerName': instance.speakerName
    };
