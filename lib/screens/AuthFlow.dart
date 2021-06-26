import 'package:discomize/screens/DiscomizeHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:discomize/screens/ApiKeys.dart' as ApiKey;

String _token = "";
String get token => _token;

Future<Null> authenticate() async {
  try {
    // Define URI paramters for Implicit Grant
    var scopes = 'user-read-recently-played%20user-top-read';
    var clientId = ApiKey.clientId;
    var redirectUri = ApiKey.redirectUri;

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
    tempToken = ApiKey.redirectUri + ":/?$tempToken";

    _token =
        ((Uri.parse(tempToken).queryParameters['access_token'])).toString();

    runApp(DiscomizeHome());
  } on PlatformException catch (e) {
    print(e);
  }
}
