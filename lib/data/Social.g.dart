// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Social _$SocialFromJson(Map<String, dynamic> json) {
  return Social()
    ..name = json['name'] as String
    ..icon = json['icon'] as String
    ..link = json['link'] as String;
}

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'link': instance.link
    };
