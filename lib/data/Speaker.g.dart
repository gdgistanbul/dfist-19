// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return Speaker()
    ..id = json['id'] as String
    ..data = json['data'] == null
        ? null
        : SpeakerData.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SpeakerToJson(Speaker instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};
