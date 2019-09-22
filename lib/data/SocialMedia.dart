import 'package:json_annotation/json_annotation.dart';

part 'SocialMedia.g.dart';

@JsonSerializable()
class SocialMedia {
  String twitter;
  String linkedin;
  String facebook;
  String instagram;
  String github;

  SocialMedia();

  factory SocialMedia.fromJson(Map<String, dynamic> json) => _$SocialMediaFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaToJson(this);
}
