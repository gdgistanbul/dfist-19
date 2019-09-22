import 'package:json_annotation/json_annotation.dart';

part 'SessionType.g.dart';

@JsonSerializable()
class SessionType {
  String type = "";

  SessionType();

  factory SessionType.fromJson(Map<String, dynamic> json) => _$SessionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SessionTypeToJson(this);
}
