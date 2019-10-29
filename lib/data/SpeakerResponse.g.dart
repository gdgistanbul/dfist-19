// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpeakerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeakerResponse _$SpeakerResponseFromJson(Map<String, dynamic> json) {
  return SpeakerResponse()
    ..speakers = (json['speakers'] as List)
        ?.map((e) =>
            e == null ? null : Speaker.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SpeakerResponseToJson(SpeakerResponse instance) =>
    <String, dynamic>{'speakers': instance.speakers};
