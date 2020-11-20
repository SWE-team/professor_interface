
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:professor_interface/Models/FutureResponse.dart';

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
}