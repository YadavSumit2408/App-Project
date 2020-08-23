////
////import 'package:flutter/cupertino.dart';
////import 'package:flutter/material.dart';
////import 'package:uiux/pages/home.dart';
////import 'package:uiux/pages/intro.dart';
////import 'package:firebase_auth/firebase_auth.dart';
////import 'package:uiux/pages/sign_up.dart';
////
////enum AuthStatus{
////  notLoggedIn,
////  loggedIn,
////}
////
////class OurRoot extends StatefulWidget {
////  @override
////  _OurRootState createState() => _OurRootState();
////}
////
////class _OurRootState extends State<OurRoot> {
////  String uid = '';
////  getUid() {}
////  AuthStatus _authStatus = AuthStatus.notLoggedIn;
////  bool isLoading = false;
////  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
////
////  @override
////  void initState() {
////    this.uid = '';
////    FirebaseAuth.instance.currentUser().then((val) {
////      setState(() {
////        this.uid = val.uid;
////      });
////    }).catchError((e) {
////      print(e);
////    });
////    super.initState();
////    isSignedIn();
////  }
////  void isSignedIn() async {
////    this.setState(() {
////      isLoading = true;
////    });
////
////    firebaseAuth.currentUser().then((user) {
////      if (user != null) {
////        Navigator.pushReplacement(
////          context,
////          MaterialPageRoute(builder: (context) => Home()),
////        );
////      } else {
////        SignUp();
////      }
////    });
////    this.setState(() {
////      isLoading = false;
////    });
////  }
////
////
////
////
////  void didChangeDependencies() async{
////    // TODO: implement didChangeDependencies
////    super.didChangeDependencies();
//////     get the state, chk current user, set auth state based on state
////
////
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    throw UnimplementedError();
////  }
////
////
//
//
//class OurRoot extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return
//    if (await FirebaseAuth.instance.currentUser() != null) {
//    // signed in
//    } else {
//
//    }
//
//  }
//}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uiux/pages/homepage.dart';
import 'package:uiux/pages/sign_up.dart';

class AuthService  extends StatelessWidget {
  //Handles Auth
  @override
//  handleAuth() {
//    return StreamBuilder<FirebaseUser>(
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.active) {
//            FirebaseUser user = snapshot.data;
//            return DashboardPage();
//          } else {
//            return LoginPage();
//          }
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user == null) {
              return SignUp();
            }
            return DashboardPage(price: null,);
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  //Sign out
  signOut() async {
    try {
      FirebaseAuth.instance.signOut();
    }catch(e){
      print(e);
    }
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}