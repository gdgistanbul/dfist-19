import 'package:json_annotation/json_annotation.dart';
part 'SessionData.g.dart';

@JsonSerializable()
class SessionData {
  String title;
  String language;
  String description;
  String presentation;
  String complexity;
  List<String> tags;
  List<String> speakers;
  String videoId;
  int extend;
  String icon;
  String image;

  SessionData();

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDataToJson(this);
}
