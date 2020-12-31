import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/screens/mood_albums/goodVibes.dart';
import 'package:music/screens/mood_albums/love.dart';
import 'package:music/screens/mood_albums/party.dart';
import 'package:music/screens/player.dart';
import 'package:percent_indicator/percent_indicator.dart';

//Media Queries
// credits to this post author: https://medium.com/flutter-community/flutter-effectively-scale-ui-according-to-different-screen-sizes-2cb7c115ea0a
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  int _index = 0;
  bool toggle1 = false; //var for changing the icon of heart in song player
  bool toggle2 =
      false; //var for changing the icon of play to pause and vice-versa in song player

  //To navigate pages when user selects an album(in mood)
  Future navigateToLove(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Love()));
  }

  Future navigateToParty(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Party()));
  }

  Future navigateToGoodVibes(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GoodVibes()));
  }

  Future navigateToPlayer(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
  }

  //Images for album covers
  final List imgList = [
    'lib/assets/images/love.png',
    'lib/assets/images/goodVibes.png',
    'lib/assets/images/party.png',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.asset(
                        imgList[index],
                        fit: BoxFit.cover,
                      );
                    },

                    //Code to navigate when user selects a card(in flutter swipper)
                    onTap: (_index) {
                      if (_index == 0) {
                        navigateToLove(context);
                      } else if (_index == 1) {
                        navigateToGoodVibes(context);
                      } else if (_index == 2) {
                        navigateToParty(context);
                      }
                    },
                    itemCount: 3,
                    viewportFraction: 0.7,
                    scale: 0.8,
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.36,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10, right: 20, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text("PLAYLIST",
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),

                  //Code for playlist songs
                  Container(
                    height: SizeConfig.screenHeight * 0.28,
                    child: Flexible(
                      child: ListView(
                        children: <Widget>[
                          Card(
                            child: const ListTile(
                              leading: Image(
                                image:
                                    AssetImage('lib/assets/images/song1.png'),
                              ),
                              title: Text('We Do Talk'),
                              subtitle: Text('Athena'),
                              trailing: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "3:51",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: const ListTile(
                              leading: Image(
                                image:
                                    AssetImage('lib/assets/images/song2.png'),
                              ),
                              title: Text('Drag Me Up'),
                              subtitle: Text('Charles'),
                              trailing: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "3:43",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: const ListTile(
                              leading: Image(
                                image:
                                    AssetImage('lib/assets/images/song3.png'),
                              ),
                              title: Text('Time'),
                              subtitle: Text('Nolan'),
                              trailing: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "2:49",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: const ListTile(
                              leading: Image(
                                image:
                                    AssetImage('lib/assets/images/song4.png'),
                              ),
                              title: Text('I am Wondering'),
                              subtitle: Text('Shawn'),
                              trailing: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "3:21",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //player at bottom
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: SizeConfig.screenHeight * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new LinearPercentIndicator(
                        width: SizeConfig.screenWidth,
                        lineHeight: 5.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey[300],
                        progressColor: Colors.deepPurpleAccent,
                        linearStrokeCap: LinearStrokeCap.butt,
                      ),
                    ],
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5, right: 10, bottom: 0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image:
                                AssetImage('lib/assets/images/player_img.jpg'),
                            height: 60,
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.05),

                        //Song name and artist name
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Wake Up",
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                  "Shih Tzu",
                                  style: GoogleFonts.lato(fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.18),
                        IconButton(
                            icon: toggle1
                                ? Icon(Icons.favorite)
                                : Icon(
                                    Icons.favorite_border,
                                  ),
                            color: toggle1
                                ? Colors.red
                                : Colors
                                    .black, //when icon is not pressed the outline color will be black and when the icon is pressed the icon color changes to red
                            iconSize: 30,
                            onPressed: () {
                              setState(() {
                                // Here we changing the icon.
                                toggle1 = !toggle1;
                              });
                            }),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.001,
                        ),
                        IconButton(
                            icon: toggle2
                                ? Icon(Icons.pause_rounded)
                                : Icon(
                                    Icons.play_arrow_rounded,
                                  ),
                            iconSize: 30,
                            onPressed: () {
                              setState(() {
                                // Here we changing the icon.
                                toggle2 = !toggle2;
                              });
                            }),
                        SizedBox(width: SizeConfig.screenWidth * 0.001),
                        IconButton(
                            icon: Icon(Icons.expand_less_rounded),
                            iconSize: 40,
                            onPressed: () {
                              navigateToPlayer(context);
                            })
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
