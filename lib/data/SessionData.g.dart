// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionData _$SessionDataFromJson(Map<String, dynamic> json) {
  return SessionData()
    ..title = json['title'] as String
    ..language = json['language'] as String
    ..description = json['description'] as String
    ..presentation = json['presentation'] as String
    ..complexity = json['complexity'] as String
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..speakers = (json['speakers'] as List)?.map((e) => e as String)?.toList()
    ..videoId = json['videoId'] as String
    ..extend = json['extend'] as int
    ..icon = json['icon'] as String
    ..image = json['image'] as String;
}

Map<String, dynamic> _$SessionDataToJson(SessionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'language': instance.language,
      'description': instance.description,
      'presentation': instance.presentation,
      'complexity': instance.complexity,
      'tags': instance.tags,
      'speakers': instance.speakers,
      'videoId': instance.videoId,
      'extend': instance.extend,
      'icon': instance.icon,
      'image': instance.image
    };
