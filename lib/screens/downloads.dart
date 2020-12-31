import 'package:flutter/material.dart';
import 'package:music/screens/mood.dart';
import 'package:music/screens/player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  bool toggle1 = false; //var for changing the icon of heart in song player
  bool toggle2 =
      false; //var for changing the icon of play to pause and vice-versa in song player

  Future navigateToPlayer(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 2.85 / 4,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(child: Image.asset('lib/assets/images/Empty.png')),
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
