import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:professor_interface/components/CourseTile.dart';
import 'package:professor_interface/screens/AddCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesList extends StatelessWidget {
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to log out??'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();

                prefs.remove('isUserLoggedIn');
                prefs.remove('id');
                SystemNavigator.pop();
                //Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: ()  {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AMS'),
        actions: [
          IconButton(
        icon: Icon(
        Icons.power_settings_new,
          color: Colors.white,
        ),
        onPressed: (){
          _showMyDialog(context);
          })
        ],
      ),
       body: ListView(
          children: [
            CourseTile("CS123","Data Structure"),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddCourses(),
                  )
              )
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,

      ),
    );
  }
}
