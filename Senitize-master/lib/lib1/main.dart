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
  "/homesig": (BuildContext context) => DashboardPage(price: null,),
  "/intro": (BuildContext context) => IntroScreen(), 
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData( primaryColor: Colors.black, accentColor: Colors.greenAccent,fontFamily: 'Montserrat'),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes
));



//
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(VerifyPhoneRoute());
//
//class VerifyPhoneRoute extends StatefulWidget {
//  @override
//  _VerifyPhoneRouteState createState() {
//    return _VerifyPhoneRouteState();
//  }
//}
//
//class _VerifyPhoneRouteState extends State<VerifyPhoneRoute> {
//  bool isLoading = false;
//  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  String verificationId;
//  String phoneNo = "Your number here";
//  String smsCode;
//
//  @override
//  void initState() {
//    super.initState();
//    isSignedIn();
//  }
//
//  void isSignedIn() async {
//    this.setState(() {
//      isLoading = true;
//    });
//
//    firebaseAuth.currentUser().then((user) {
//      if (user != null) {
//        Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(builder: (context) => HomeRoute()),
//        );
//      } else {
//        verifyPhone();
//      }
//    });
//    this.setState(() {
//      isLoading = false;
//    });
//  }
//
//  Future<void> verifyPhone() async {
//    final PhoneVerificationCompleted verificationCompleted =
//        (AuthCredential credential) {
//      print("verified");
//    };
//
//    final PhoneVerificationFailed verifyFailed = (AuthException exception) {
//      print("${exception.message}");
//    };
//
//    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//      this.verificationId = verId;
//      smsCodeDialog(context).then((value) {
//        print("Signed in");
//      });
//    };
//
//    final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String verId) {
//      this.verificationId = verId;
//    };
//
//    await firebaseAuth.verifyPhoneNumber(
//        phoneNumber: this.phoneNo,
//        codeAutoRetrievalTimeout: autoRetrieval,
//        codeSent: smsCodeSent,
//        timeout: const Duration(seconds: 10),
//        verificationCompleted: verificationCompleted,
//        verificationFailed: verifyFailed);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Flutter Inapp Plugin by dooboolab'),
//        ),
//        body: Center(
//          child: RaisedButton(
//              child: Text("Verify"),
//              onPressed: () {
//                verifyPhone();
//              }),
//        ),
//      ),
//    );
//  }
//
//  Future<bool> smsCodeDialog(BuildContext context) {
//    return showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return new AlertDialog(
//            title: Text('Enter sms Code'),
//            content: TextField(
//              onChanged: (value) {
//                this.smsCode = value;
//              },
//            ),
//            contentPadding: const EdgeInsets.all(10.0),
//            actions: <Widget>[
//              new FlatButton(
//                child: Text("Done"),
//                onPressed: () {
//                  firebaseAuth.currentUser().then((user) {
//                    if (user != null) {
//                      Navigator.of(context).pop();
//                      Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => HomeRoute()),
//                      );
//                    } else {
//                      Navigator.of(context).pop();
//                      signIn();
//                    }
//                  });
//                },
//              )
//            ],
//          );
//        });
//  }
//
//  signIn() async {
//    AuthCredential credential = PhoneAuthProvider.getCredential(
//        verificationId: verificationId, smsCode: smsCode);
//    await firebaseAuth.signInWithCredential(credential).then((user) {
//      Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(builder: (context) => HomeRoute()),
//      );
//      print('signed in with phone number successful: user -> $user');
//    }).catchError((onError) {
//      print(onError);
//    });
//  }
//}
//
//class HomeRoute extends StatefulWidget {
//  @override
//  _HomeRouteState createState() {
//    return _HomeRouteState();
//  }
//}
//
//class _HomeRouteState extends State<HomeRoute> {
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Flutter Inapp Plugin by dooboolab'),
//        ),
//        body: Center(
//          child: Text("Welcome There."),
//        ),
//      ),
//    );
//  }
//}