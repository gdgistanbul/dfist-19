import 'dart:async';
import 'dart:convert';
import 'package:dfist19/data/SessionsResponse.dart';
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
    final response = await http.get("https://us-central1-dfist19.cloudfunctions.net/helu-restful/sessions");

    if (response.statusCode == 200) {
      return SessionsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
