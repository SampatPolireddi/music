import 'package:flutter/material.dart';
import 'package:music/screens/artists.dart';
import 'package:music/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Home(),
    );
  }
}
