import 'package:json_annotation/json_annotation.dart';

import 'SpeakerData.dart';

part 'Speaker.g.dart';

@JsonSerializable()
class Speaker {
  String id;
  SpeakerData data;

  Speaker();

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);
  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}


