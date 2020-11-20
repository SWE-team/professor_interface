import 'package:flutter/material.dart';
import 'package:professor_interface/screens/WelcomeScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMS',
      home: WelcomeScreen(),
    );
  }
}


