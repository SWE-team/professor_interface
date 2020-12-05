import 'package:flutter/material.dart';
import 'package:professor_interface/components/EnrolledStudentTile.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  String code = " ";
  @override
  Widget build(BuildContext context) {
    return     ListView(
      children: [
        EnrolledStudentTile("CS19B1013","Jatin",0.7),
        EnrolledStudentTile("CS19B1017","Kushagra",0.5),
        EnrolledStudentTile("CS19B1028","Abhijeet",0.8),
      ],
    );
  }
}
