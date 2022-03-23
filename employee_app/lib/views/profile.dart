
import 'package:flutter/material.dart';
import '../services/widgets.dart';
import 'home_page.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Icon(Icons.person,size: 50,),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Sumit Yadav"
                ,style: TextStyle(
                  fontSize: 16.0,
                  color:Colors.blueGrey,
                  fontWeight: FontWeight.w500,
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Uttar Pradesh, India"
                ,style: TextStyle(
                fontSize: 16.0,
                color:Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Flutter Developer at XYZ Company"
                ,style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "App Developer "
                ,style: TextStyle(
                fontSize: 16.0,
                color:Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text("Project",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("15",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Contact ')),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );},
                      child: const Text('Back To Home')),
                ],
              ),
              const SizedBox(height:225),
              Positioned(
                child: BottomBar(),
                bottom: 5,
                left: 5,
                right: 5,
              ),
            ],
          ),
        )
    );
  }
}