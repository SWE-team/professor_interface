import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:professor_interface/HandleNetworking.dart';
import 'package:professor_interface/components/CourseTile.dart';
import 'package:professor_interface/screens/AddCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {



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



    Future<List<CourseTile>> coursesList;
    void fetchCoursesList() async
    {
      HandleNetworking handleNetworking = HandleNetworking();
      coursesList =  handleNetworking.getCourses();
    }

    @override
  void initState() {
    super.initState();
    fetchCoursesList();

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
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: (){
                fetchCoursesList();
                setState(() {
                  
                });
              }),
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
       body: FutureBuilder<List<CourseTile>>(
         future: coursesList,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return ListView(
               children: snapshot.data,
             );
           } else if (snapshot.hasError) {
             return Text("${snapshot.error}");
           }

           return Center(child: CircularProgressIndicator());
         },
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // showModalBottomSheet(
          //     context: context,
          //     isScrollControlled: true,
          //     builder: (context) => SingleChildScrollView(
          //         child:Container(
          //           padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          //           child: AddCourses(),
          //         )
          //     )
          // );
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCourses())
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
