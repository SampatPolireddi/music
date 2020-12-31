import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/screens/mood.dart';
import 'package:music/screens/player.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Party extends StatefulWidget {
  @override
  _PartyState createState() => _PartyState();
}

class _PartyState extends State<Party> {
  bool toggle1 = false;
  bool toggle2 = false;
  bool status = false;
  Future navigateToPlayer(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.navigate_before_rounded,
                        color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.music_note_rounded,
                      color: Colors.black,
                    ),
                    Container(
                      child: Title(
                        color: Colors.black,
                        child: Text("MUSIC",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black)),
                      ),
                    ),
                  ],
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
              decoration: BoxDecoration(color: Colors.grey[100]),
              height: SizeConfig.screenHeight * 1.5 / 4,
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage('lib/assets/images/party.png'),
                        height: SizeConfig.screenHeight * 1 / 4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Party",
                          style: GoogleFonts.lato(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.1,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ALBUM",
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    // switch
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Download",
                            style: GoogleFonts.lato(
                                fontSize: 18, color: Colors.grey[600]),
                          ),
                        ),
                        FlutterSwitch(
                          width: 55.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          value: status,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                              //write the backend code here for downloading the album
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: SizeConfig.screenHeight * 1.23 / 4,

              //Code for playlist songs
              child: Container(
                height: SizeConfig.screenHeight * 0.20,
                width: SizeConfig.screenWidth,
                child: Flexible(
                  child: ListView(
                    children: <Widget>[
                      Card(
                        child: const ListTile(
                          leading: Image(
                            image: AssetImage('lib/assets/images/song1.png'),
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
                            image: AssetImage('lib/assets/images/song2.png'),
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
                            image: AssetImage('lib/assets/images/song3.png'),
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
                            image: AssetImage('lib/assets/images/song4.png'),
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
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 5, right: 10, bottom: 0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                image: AssetImage(
                                    'lib/assets/images/player_img.jpg'),
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
