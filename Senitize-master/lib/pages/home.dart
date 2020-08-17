import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uiux/pages/senitfact.dart';
import 'package:uiux/pages/senithome.dart';
import 'package:uiux/pages/senitoff.dart';
import 'package:uiux/pages/senitvilla.dart';
import 'package:uiux/widgets/carousal1.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Categories ❤',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: _icons
//                  .asMap()
//                  .entries
//                  .map(
//                    (MapEntry map) => _buildIcon(map.key),
//              )
//                  .toList(),
//            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get Your Home Sanitize in just 3 tap",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹10 per 100 sq.ft is the minor value of your safety",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senithome()));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get Your OFFICE Sanitize in just 3 tap",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹10 per 100 sq.ft is the minor value of your safety",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitoff()));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get Your VILLA Sanitize in just 3 tap",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹10 per 100 sq.ft is the minor value of your safety",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitvilla()));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get Your FACTORY Sanitize in just 3 tap",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹10 per 100 sq.ft is the minor value of your safety",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitfact()));},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
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
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
