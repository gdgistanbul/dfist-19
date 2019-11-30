// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpeakerData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeakerData _$SpeakerDataFromJson(Map<String, dynamic> json) {
  return SpeakerData()
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..title = json['title'] as String
    ..order = json['order'] as int
    ..featured = json['featured'] as bool
    ..company = json['company'] as String
    ..companyLogoUrl = json['companyLogoUrl'] as String
    ..country = json['country'] as String
    ..socials = (json['socials'] as List)
        ?.map((e) =>
            e == null ? null : Social.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..bio = json['bio'] as String
    ..shortBio = json['shortBio'] as String
    ..photoUrl = json['photoUrl'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$SpeakerDataToJson(SpeakerData instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'title': instance.title,
      'order': instance.order,
      'featured': instance.featured,
      'company': instance.company,
      'companyLogoUrl': instance.companyLogoUrl,
      'country': instance.country,
      'socials': instance.socials,
      'bio': instance.bio,
      'shortBio': instance.shortBio,
      'photoUrl': instance.photoUrl,
      'name': instance.name
    };
