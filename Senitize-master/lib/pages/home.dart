import 'package:flutter/material.dart';
import 'package:uiux/pages/user.dart';
import 'categories.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _children = [
    Categories(),
    Profile(),
  ];

  int _currentIndex = 0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.local_pizza,
//              size: 30.0,
//            ),
//            title: SizedBox.shrink(),
//          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg'),
            ),
            title: SizedBox.shrink(),

          )
        ],
      ),
    );
  }
}
