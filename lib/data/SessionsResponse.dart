import 'package:json_annotation/json_annotation.dart';
import 'Session.dart';

part 'SessionsResponse.g.dart';

@JsonSerializable()
class SessionsResponse {

  List<Session> sessions;

  SessionsResponse();

  factory SessionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsResponseToJson(this);
}
