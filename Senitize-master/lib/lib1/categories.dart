import 'package:flutter/material.dart';
import 'package:uiux/pages/senitfact.dart';
import 'package:uiux/pages/senithome.dart';
import 'package:uiux/pages/senitoff.dart';
import 'package:uiux/pages/senitvilla.dart';
import 'package:uiux/widgets/carousal1.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String p_home = '300';
  String p_office = '500';
  String p_villa = '700';
  String p_factory = '900';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.black,
      
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 20.0, right: 120.0),
            //   child: Text(
            //     'Categories ❤',
            //     style: TextStyle(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
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
                margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "3 Tap Surroundings Sanitization-Tap Here",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter Your approx Area measure Here",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => Senithome(home: p_home,)));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "3 Tap Live Place Sanitization-Tap Here",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter Your approx. Area measure Here",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitoff(office: p_office)));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "3 Tap Work Place Place Sanitization-Tap Here",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter Your approx. Area measure Here",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitvilla(villa: p_villa)));},
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "3 Tap Public Place Sanitization-Tap Here",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter Your approx. Area measure Here",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Senitfact(factory: p_factory)));},
            ),
          ],
        ),
      ),
    );
  }
}
