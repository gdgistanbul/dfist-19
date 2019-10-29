
import 'package:json_annotation/json_annotation.dart';

part 'Social.g.dart';

@JsonSerializable()
class Social {
  String name;
  String icon;
  String link;

  Social();

  factory Social.fromJson(Map<String, dynamic> json) =>
      _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
