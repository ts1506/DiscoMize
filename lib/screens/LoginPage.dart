import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discomize/auth/AuthFlow.dart' as AuthFlow;
import 'package:discomize/screens/AboutPage.dart';
import 'package:flutter/services.dart';
import 'package:align_positioned/align_positioned.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Force Portrait since the app isn't designed for rotation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Discoverify',
      home: MyLoginPage(),
    );
  }
}

// Main Screen
class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          Center(
            child:
                Image(image: AssetImage('assets/screens/Discomize-Login.png')),
          ),
          AlignPositioned(
            alignment: Alignment(0, 0.87),
            child: CupertinoButton(
              child: Text(
                'Why do we need this?',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AboutPage()));
              },
            ),
          ),
          AlignPositioned(
            alignment: Alignment(0, 0.75),
            child: CupertinoButton.filled(
              child: Text('Connect with Spotify'),
              onPressed: () {
                AuthFlow.authenticate();
              },
            ),
          ),
        ],
      ),
    );
  }
}
