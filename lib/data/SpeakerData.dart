import 'package:json_annotation/json_annotation.dart';
import 'Social.dart';

part 'SpeakerData.g.dart';

@JsonSerializable()
class SpeakerData {
  List<String> tags;
  String title;
  int order;
  bool featured;
  String company;
  String companyLogoUrl;
  String country;
  List<Social> socials;
  String bio;
  String shortBio;
  String photoUrl;
  String name;

  SpeakerData();

  factory SpeakerData.fromJson(Map<String, dynamic> json) =>
      _$SpeakerDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerDataToJson(this);
}
