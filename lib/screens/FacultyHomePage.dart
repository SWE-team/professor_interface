import 'package:flutter/material.dart';

class FacultyHomePage extends StatefulWidget {
  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AMS'),
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 220,
        width: double.maxFinite,
        child: Card(
          child: new InkWell(onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Tap'),
            ));
          }),
          elevation: 5,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Courses',
            icon: Icon(Icons.format_list_bulleted),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}