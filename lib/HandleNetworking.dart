
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:professor_interface/Models/FutureResponse.dart';
import 'package:professor_interface/components/CourseTile.dart';
import 'package:professor_interface/components/EnrolledStudentTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandleNetworking
{

  final String url2 =
      "https://ams-swe.herokuapp.com";
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
      final http.Response response = await http.get(url2 + "/api/course/getcourses/" + profId);

      if(response.statusCode == 200)
        {
            var jsonRes = jsonDecode(response.body);
            List courses = jsonRes['result'];
            // print(courses);
            List<CourseTile> coursesTileList = [];

            for (int i = 0;i < courses.length;i++)
            {
              // print(courses[i]);
              coursesTileList.add(CourseTile(courses[i]['_id'], courses[i]['name'],courses[i]['course_id']));
            }

            return coursesTileList;

        }
        else
          {
            throw Exception('Failed to load album');
          }

    }

    Future<bool> addCourse(String courseName,String courseId) async
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profId = prefs.getString('id');

      final http.Response response = await http.post(
          url2 + "/api/course/create",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{

            'name' : courseName,
            'admin_id': profId,
            'course_id' : courseId,
          })

      );


      if(response.statusCode == 200)
        return true;
      else
        return false;
    }

    Future<int> openPortal(String id) async
    {
      final http.Response response = await http.get(url2 + "/api/course/start/" + id);

      if(response.statusCode == 200)
        {
          var decodedRes = jsonDecode(response.body);
          print(decodedRes['result']);
          return decodedRes['result'];
        }
      else
        {
          return null;
        }

    }

    Future<bool> deleteCourse(String id) async
    {
      final http.Response response = await http.delete(
        url2 + '/$id',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if(response.statusCode == 200)
        return true;
      else
        return false;
    }

  Future<List<EnrolledStudentTile>> getEnrolledStudents(String id) async
  {

    final http.Response response = await http.get(url2 + "/api/course/home/" + id);

    if(response.statusCode == 200)
    {
      var jsonRes = jsonDecode(response.body);
      var students= jsonRes['name'];
      print(students);
      List<EnrolledStudentTile> studentTileList = [];

      for (int i = 0;i < students.length;i++)
      {
        studentTileList.add(EnrolledStudentTile(jsonRes['roll'][i],jsonRes['name'][i],jsonRes['attendance'][i].toDouble()));
      }

      return studentTileList;

    }
    else
    {
      throw Exception('Failed to load album');
    }

  }

}