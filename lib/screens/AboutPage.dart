import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discomize/screens/LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:align_positioned/align_positioned.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Force Portrait since the app isn't designed for rotation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('About DiscoMize'),
      ),
      child: MyAboutPage(),
    );
  }
}

// Main Screen
class MyAboutPage extends StatefulWidget {
  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AlignPositioned(
          alignment: Alignment(0, -0.7),
          childWidthRatio: 0.9,
          child: Image(image: AssetImage('assets/logos/Discomize-Color.png')),
        ),
        AlignPositioned(
          alignment: Alignment(0, -0.35),
          childWidthRatio: 0.9,
          child: Text(
            "With DiscoMize, let's jog our music memories. Discover your favorites, remember forgotten gems and relive your musical history.",
            style: TextStyle(
                fontFamily: 'PTSansNarrow',
                fontSize: 25,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
        AlignPositioned(
          alignment: Alignment(0, -0.1),
          childWidthRatio: 0.9,
          child: Text(
            "Spotify Account",
            style: TextStyle(
                fontFamily: 'PTSansNarrowBold',
                fontSize: 30,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
        AlignPositioned(
          alignment: Alignment(0, 0.12),
          childWidthRatio: 0.9,
          child: Text(
            "We require a Spotify account, and need access to your playback data. DiscoMize is a client-only app and no data is stored or transmitted.",
            style: TextStyle(
                fontFamily: 'PTSansNarrow',
                fontSize: 25,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
        AlignPositioned(
          alignment: Alignment(0, 0.31),
          childWidthRatio: 0.9,
          child: Text(
            "Permissions and Privacy",
            style: TextStyle(
                fontFamily: 'PTSansNarrowBold',
                fontSize: 30,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
        AlignPositioned(
          alignment: Alignment(0, 0.52),
          childWidthRatio: 0.9,
          child: Text(
            "We use the following permissions:\n• user-read-recently-played\n• user-top-read",
            style: TextStyle(
                fontFamily: 'PTSansNarrow',
                fontSize: 25,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
        AlignPositioned(
          alignment: Alignment(0, 0.87),
          childWidthRatio: 0.9,
          child: Text(
            "DiscoMize uses Spotify's Implicit Grant authorization. We do not store tokens, and DiscoMize requires re-auth on launch.",
            style: TextStyle(
                fontFamily: 'PTSansNarrow',
                fontSize: 25,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.label, context)),
          ),
        ),
      ],
    );
    //);
  }
}
