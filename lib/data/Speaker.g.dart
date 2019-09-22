// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return Speaker()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..surname = json['surname'] as String
    ..image = json['image'] as String
    ..bio = json['bio'] as String
    ..title = json['title'] as String
    ..company = json['company'] as String
    ..socialMedia = json['socialMedia'] == null
        ? null
        : SocialMedia.fromJson(json['socialMedia'] as Map<String, dynamic>)
    ..sessions = (json['sessions'] as List)
        ?.map((e) =>
            e == null ? null : Session.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'image': instance.image,
      'bio': instance.bio,
      'title': instance.title,
      'company': instance.company,
      'socialMedia': instance.socialMedia,
      'sessions': instance.sessions
    };
