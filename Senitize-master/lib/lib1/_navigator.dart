import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
  static void goTosignup(BuildContext context) {
    Navigator.pushNamed(context, "/signup");
  }
  static void goTohome1(BuildContext context) {
    Navigator.pushNamed(context, "/homepage");
  }

}