
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:professor_interface/Models/FutureResponse.dart';
import 'package:professor_interface/components/CourseTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandleNetworking
{
  Future<FutureResponse> registerFaculty(String facultyEmail,String facultyName,String facultyPassword) async {

    final http.Response response = await http.post(
      "https://signin-rest-api.herokuapp.com/faculty/register",

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': facultyEmail,
        'password': facultyPassword,
        'name': facultyName,
      })

    );
      print(response.body);
      if(response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500)
        return FutureResponse.fromJson(jsonDecode(response.body));
      else
        return null;


  }

  Future<FutureResponse> loginFaculty(String facultyEmail,String facultyPassword) async {

    final http.Response response = await http.post(
        "https://signin-rest-api.herokuapp.com/faculty/login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': facultyEmail,
          'password': facultyPassword,
        })

    );
    print(response.body);
    if(response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500)
      return FutureResponse.fromJson(jsonDecode(response.body));
    else
      return null;


  }

    Future<List<CourseTile>> getCourses() async
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profId = prefs.getString('id');
      final http.Response response = await http.get("https://lit-reef-57031.herokuapp.com/api/course/getcourses/" + profId);

      if(response.statusCode == 200)
        {
            var jsonRes = jsonDecode(response.body);
            List courses = jsonRes['result'];
            print(courses);
            List<CourseTile> coursesTileList = [];

            for (int i = 0;i < courses.length;i++)
            {
              coursesTileList.add(CourseTile("Todo", courses[i]['name']));
            }

            return coursesTileList;

        }
        else
          {
            return null;
          }

    }

    Future<bool> addCourse(String courseName,String courseId) async
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profId = prefs.getString('id');

      final http.Response response = await http.post(
          "https://lit-reef-57031.herokuapp.com/api/course/create",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{

            'name' : courseName,
            'admin_id': profId,
          })

      );

      if(response.statusCode == 200)
        return true;
      else
        return false;
    }
}