import 'package:discomize/screens/DiscomizeHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;

String _token = "";
String get token => _token;

Future<Null> authenticate() async {
  try {
    // Define URI paramters for Implicit Grant
    var scopes = 'user-read-recently-played%20user-top-read';

    // For Readers - Replace clientId and redirectUri with your own values
    var clientId = 'CLIENT_ID';
    var redirectUri = 'REDIRECT_URI';

    // Construct URI
    var authUri = 'https://accounts.spotify.com/authorize' +
        '?client_id=' +
        clientId +
        '&response_type=token' +
        '&redirect_uri=' +
        redirectUri +
        ':/' +
        '&scope=' +
        scopes;

    final result = await FlutterWebAuth.authenticate(
        url: authUri, callbackUrlScheme: redirectUri);

    // Easy Parsing Hack
    final tempRes = Uri.parse(result);
    String tempToken = tempRes.fragment;
    tempToken = "discomize:/?$tempToken";

    _token =
        ((Uri.parse(tempToken).queryParameters['access_token'])).toString();

    runApp(DiscomizeHome());
  } on PlatformException catch (e) {
    print(e);
  }
}
