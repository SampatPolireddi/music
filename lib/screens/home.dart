import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/screens/artists.dart';
import 'package:music/screens/mood.dart';
import 'package:music/screens/downloads.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    //TabBar tabs names
    Tab(
      child: Text("MOOD",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold)),
    ),
    Tab(
      child: Text("ARTISTS",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold)),
    ),
    Tab(
      child: Text("DOWNLOADS",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.search_rounded, color: Colors.black),
                    onPressed: () {}),
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
          bottom: TabBar(
            onTap: (index) {},
            controller: _controller,
            tabs: list,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            //Navigating to diffent screens by tabbar
            Mood(),
            Artists(),
            Downloads(),
          ],
        ),
      ),
    );
  }
}
