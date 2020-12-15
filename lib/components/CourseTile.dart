import 'package:flutter/material.dart';
import 'package:professor_interface/screens/FacultyHomePage.dart';

class CourseTile extends StatelessWidget {

  final String id;
  final String courseName;
  final String courseCode;

  CourseTile(this.id,this.courseCode,this.courseName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FacultyHomePage(id)),
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
