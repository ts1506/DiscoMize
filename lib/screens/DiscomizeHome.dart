import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discomize/dataHandler/FetchData.dart' as FetchData;
import 'package:discomize/helpers/LaunchURL.dart' as Url;
import 'package:flutter/services.dart';
import 'package:discomize/screens/AboutPage.dart';
import 'package:align_positioned/align_positioned.dart';

class DiscomizeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Force Portrait since the app isn't designed for rotation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'DiscoMize',
      home: MyHomePage(),
    );
  }
}

// Main Screen
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _pages = [
    TopArtistsPage(), // see the TopArtistsPage class
    TopTracksPage(), // see the TopTracksPage class
    RecentsPage(), // see the RecentsPage class
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('DiscoMize'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => AboutPage()));
          },
          child: Icon(CupertinoIcons.info),
        ),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.star), label: "Top Artists"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart), label: "Top Tracks"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.clock), label: "Recently Played"),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _pages[index];
          }),
    );
  }
}

// TopArtistsPage
class TopArtistsPage extends StatelessWidget {
  var time = 'long_term';
  late Future<List<dynamic>> artistData = FetchData.getArtistData(time);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: artistData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Card(
                      color: Colors.orange,
                      child: Image.network(
                          snapshot.data![index]["images"][0]["url"]),
                    ),
                    AlignPositioned(
                      alignment: Alignment(-0.8, -0.9),
                      childWidthRatio: 0.7,
                      child: Text(
                        snapshot.data![index]["name"],
                        style: TextStyle(
                            fontFamily: 'PTSansNarrow',
                            color: Colors.white,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            fontSize: 20.0),
                      ),
                    ),
                    AlignPositioned(
                      alignment: Alignment(0.85, 0.85),
                      childHeightRatio: 0.25,
                      childWidthRatio: 0.25,
                      child: ElevatedButton(
                        child: Icon(CupertinoIcons.play),
                        onPressed: () {
                          Url.launchUniversal(snapshot.data![index]
                              ["external_urls"]["spotify"]);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange, shape: CircleBorder()),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // Default to Activity Indicator
          return CupertinoActivityIndicator();
        },
      ),
    );
  }
}

// TopTracksPage
class TopTracksPage extends StatelessWidget {
  var time = 'long_term';
  late Future<List<dynamic>> tracksData = FetchData.getTracksData(time);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: tracksData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Card(
                      color: Colors.orange,
                      child: Image.network(
                          snapshot.data![index]["album"]["images"][0]["url"]),
                    ),
                    AlignPositioned(
                      alignment: Alignment(-0.8, -0.9),
                      childWidthRatio: 0.7,
                      child: Text(
                        snapshot.data![index]["name"],
                        style: TextStyle(
                            fontFamily: 'PTSansNarrow',
                            color: Colors.white,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            fontSize: 20.0),
                      ),
                    ),
                    AlignPositioned(
                      alignment: Alignment(0.85, 0.85),
                      childHeightRatio: 0.25,
                      childWidthRatio: 0.25,
                      child: ElevatedButton(
                        child: Icon(CupertinoIcons.play),
                        onPressed: () {
                          Url.launchUniversal(snapshot.data![index]
                              ["external_urls"]["spotify"]);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange, shape: CircleBorder()),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // Default to Activity Indicator
          return CupertinoActivityIndicator();
        },
      ),
    );
  }
}

// RecentsPage
class RecentsPage extends StatelessWidget {
  late Future<List<dynamic>> recentsData = FetchData.getRecentlyPlayed();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<dynamic>>(
        future: recentsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Card(
                      color: Colors.orange,
                      child: Image.network(snapshot.data![index]["track"]
                          ["album"]["images"][0]["url"]),
                    ),
                    AlignPositioned(
                      alignment: Alignment(-0.8, -0.9),
                      childWidthRatio: 0.7,
                      child: Text(
                        snapshot.data![index]["track"]["name"],
                        style: TextStyle(
                            fontFamily: 'PTSansNarrow',
                            color: Colors.white,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            fontSize: 20.0),
                      ),
                    ),
                    AlignPositioned(
                      alignment: Alignment(0.85, 0.85),
                      childHeightRatio: 0.25,
                      childWidthRatio: 0.25,
                      child: ElevatedButton(
                        child: Icon(CupertinoIcons.play),
                        onPressed: () {
                          Url.launchUniversal(snapshot.data![index]["track"]
                              ["external_urls"]["spotify"]);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange, shape: CircleBorder()),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // Default to Activity Indicator
          return CupertinoActivityIndicator();
        },
      ),
    );
  }
}
