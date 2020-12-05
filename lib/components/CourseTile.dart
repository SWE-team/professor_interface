import 'package:flutter/material.dart';
import 'package:professor_interface/screens/FacultyHomePage.dart';

class CourseTile extends StatelessWidget {

  final String courseName;
  final String courseCode;

  CourseTile(this.courseCode,this.courseName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FacultyHomePage()),
        );
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.library_books),
          title: Text(courseName),
          subtitle: Text(courseCode),
        ),

      ),
    );
  }
}
