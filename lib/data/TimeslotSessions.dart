import 'package:json_annotation/json_annotation.dart';

part 'TimeslotSessions.g.dart';

@JsonSerializable()
class Session {
  List<int> items ;

  Session();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
