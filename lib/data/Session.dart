import 'package:json_annotation/json_annotation.dart';

import 'SessionData.dart';

part 'Session.g.dart';

@JsonSerializable()
class Session{
  String id;
  SessionData data;


  Session();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
