import 'package:flutter/material.dart';
import 'package:professor_interface/components/ReusableButton.dart';

class AddCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // String courseId;
    // String courseName;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
              child: Text(
                'Add New Course',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            TextField(
              onChanged: (String value){
                //email = value;
              },
              obscureText: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "CourseId",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 30.0),
              child: TextField(
                onChanged: (String value){
                 // email = value;
                },
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Course Name",
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                ),
              ),
            ),
          ReusableButton('Add course'),
          ],
        ),
      ),
    );
  }
}
