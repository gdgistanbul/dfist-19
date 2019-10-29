// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionsResponse _$SessionsResponseFromJson(Map<String, dynamic> json) {
  return SessionsResponse()
    ..sessions = (json['sessions'] as List)
        ?.map((e) =>
            e == null ? null : Session.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SessionsResponseToJson(SessionsResponse instance) =>
    <String, dynamic>{'sessions': instance.sessions};
