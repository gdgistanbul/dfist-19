import 'package:json_annotation/json_annotation.dart';

import 'Speaker.dart';

part 'SpeakerResponse.g.dart'; 

@JsonSerializable()
class SpeakerResponse {

  List<Speaker> speakers;

  SpeakerResponse();

  factory SpeakerResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeakerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerResponseToJson(this);
}
