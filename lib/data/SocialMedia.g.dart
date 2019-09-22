// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SocialMedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) {
  return SocialMedia()
    ..twitter = json['twitter'] as String
    ..linkedin = json['linkedin'] as String
    ..facebook = json['facebook'] as String
    ..instagram = json['instagram'] as String
    ..github = json['github'] as String;
}

Map<String, dynamic> _$SocialMediaToJson(SocialMedia instance) =>
    <String, dynamic>{
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'github': instance.github
    };
