import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/screens/artistAlbum.dart';
import 'mood.dart';
import 'player.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Artists extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  bool toggle1 = false;
  bool toggle2 = false;

  Future navigateToPlayer(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
  }

  Future navigateToAlbum(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Album()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 2.85 / 4,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child:
                      //Title
                      Row(
                    children: <Widget>[
                      Text(
                        "Popular Artists",
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                //Artists
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 5,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Athena.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Charles.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Gold.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Harry.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Nolan.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Shih Tzu.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Simba.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Shawn.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'lib/assets/images/Vikki.png',
                        ),
                        iconSize: SizeConfig.screenWidth * 0.28,
                        onPressed: () {
                          navigateToAlbum(context);
                        },
                      ),
                    ],
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
                          image: AssetImage('lib/assets/images/player_img.jpg'),
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
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
    );
  }
}
