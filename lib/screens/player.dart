import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/screens/mood.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool toggle1 = false; //for heart icon
  bool toggle2 = false; //for download icon
  bool toggle3 = false; //for pause and play icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.expand_more_rounded, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Container(
                child: Title(
                  color: Colors.black,
                  child: Text("NOW PLAYING",
                      style:
                          GoogleFonts.lato(fontSize: 15, color: Colors.black)),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.more_vert_rounded, color: Colors.black),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight * 1 / 2,
            width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage('lib/assets/images/player_img.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: toggle2
                        ? Icon(Icons.download_done_rounded)
                        : Icon(Icons.download_outlined),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        // Here we changing the icon.
                        toggle2 = !toggle2;
                      });
                    }),
                Text("Wake Up",
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.bold)),
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
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.002,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Shih Tzu',
                  style:
                      GoogleFonts.lato(fontSize: 18, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.002,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 35, top: 35, right: 35, bottom: 10),
            child: Row(
              children: <Widget>[
                new LinearPercentIndicator(
                  width: SizeConfig.screenWidth * 3.3 / 4,
                  animation: true,
                  lineHeight: 5.0,
                  percent: 0.5,
                  backgroundColor: Colors.grey[300],
                  progressColor: Colors.deepPurpleAccent,
                  linearStrokeCap: LinearStrokeCap.butt,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("0:00"), Text("3:42")],
            ),
          ),

          //meadia control center
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.skip_previous_rounded),
                    iconSize: 60,
                    onPressed: () {}),
                IconButton(
                    icon: toggle3
                        ? Icon(Icons.pause_circle_filled_rounded)
                        : Icon(
                            Icons.play_circle_fill_rounded,
                          ),
                    iconSize: 60,
                    onPressed: () {
                      setState(() {
                        // Here we changing the icon.
                        toggle3 = !toggle3;
                      });
                    }),
                IconButton(
                    icon: Icon(Icons.skip_next_rounded),
                    iconSize: 60,
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
