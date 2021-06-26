import 'dart:async';
import 'package:discomize/screens/AuthFlow.dart' as AuthFlow;
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> getArtistData(var timerange) async {
  final String token = AuthFlow.token;
  var limit = '20';

  // Construct URI
  var getUri = 'https://api.spotify.com/v1/me/top/artists' +
      '?time_range=' +
      timerange +
      '&limit=' +
      limit;

  final _response = await http.get(Uri.parse(getUri), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });

  if (_response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(_response.body);
    List<dynamic> data = map["items"];
    return data;
  } else {
    throw Exception("Failed to load data");
  }
}

Future<List<dynamic>> getTracksData(var timerange) async {
  final String token = AuthFlow.token;
  var limit = '20';

  // Construct URI
  var getUri = 'https://api.spotify.com/v1/me/top/tracks' +
      '?time_range=' +
      timerange +
      '&limit=' +
      limit;

  final _response = await http.get(Uri.parse(getUri), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });

  if (_response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(_response.body);
    List<dynamic> data = map["items"];
    return data;
  } else {
    throw Exception("Failed to load data");
  }
}

Future<List<dynamic>> getRecentlyPlayed() async {
  final String token = AuthFlow.token;
  var limit = '20';

  // Construct URI
  var getUri = 'https://api.spotify.com/v1/me/player/recently-played' +
      '?limit=' +
      limit;

  final _response = await http.get(Uri.parse(getUri), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });

  if (_response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(_response.body);
    List<dynamic> data = map["items"];
    return data;
  } else {
    throw Exception("Failed to load data");
  }
}
