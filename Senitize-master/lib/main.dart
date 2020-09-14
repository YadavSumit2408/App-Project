import 'package:flutter/material.dart';
import 'package:uiux/pages/home.dart';
import 'package:uiux/pages/homepage.dart';
import 'package:uiux/pages/intro.dart';
import 'package:uiux/pages/splashscreen.dart';
import 'package:uiux/pages/sign_up.dart';
import 'widgets/root.dart';

var routes = <String, WidgetBuilder>{
  "/homepage": (BuildContext context) => Home(),
  "/signup": (BuildContext context) => SignUp(),
  "/homesig": (BuildContext context) => DashboardPage(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes
));
