import 'dart:async';
import 'dart:convert';
import 'package:dfist19/data/SessionsResponse.dart';
import 'package:dfist19/data/SheduleResponse.dart';
import 'package:dfist19/data/SpeakerResponse.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://us-central1-dfist19.cloudfunctions.net/helu-restful";

class API {
  static Future<SpeakerResponse> getSpeakers() async {
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return SpeakerResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<SessionsResponse> getSessions() async {
    final response = await http.get("$baseUrl/sessions");

    if (response.statusCode == 200) {
      print("200 donderdim");
      return SessionsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<SessionsResponse> getSpeakerSessions(String speakerId) async {
    final response = await http.get(baseUrl+"/$speakerId/sessions");

    if (response.statusCode == 200) {
      print("200 donderdim");
      return SessionsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<SpeakerResponse> getSessionSpaker(String speakerId) async {
    final response = await http.get(baseUrl+"/$speakerId");

    if (response.statusCode == 200) {
      print("200 donderdim");
      return SpeakerResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<ScheduleResponse> getSchedule() async {
    final response = await http.get(baseUrl+"/schedule");

    if (response.statusCode == 200) {
      return ScheduleResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


}
