////import 'package:flutter/material.dart';
////
////class SignUp extends StatefulWidget {
////  @override
////  _SignUpState createState() => _SignUpState();
////}
////
////class _SignUpState extends State<SignUp> {
////  @override
////  Widget build(BuildContext context) {
////    return Container(
////      child: Text(
////        "Signup here",
////        style: TextStyle(
////            color: Colors.white,
////            fontWeight: FontWeight.bold,
////            fontSize: 24.0),
////      ),
////    );
////  }
////}
//
//
//import 'dart:async';
//
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//
//class SignUp extends StatefulWidget {
//  @override
//  _SignUpState createState() => new _SignUpState();
//}
//
//class _SignUpState extends State<SignUp> {
//  String phoneNo;
//  String smsCode;
//  String verificationId;
//
//  Future<void> verifyPhone() async {
//    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
//      this.verificationId = verId;
//    };
//
//    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//      this.verificationId = verId;
//      smsCodeDialog(context).then((value) {
//        print('Signed in');
//      });
//    };
//
//    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
//      print('verified');
//    };
//
//    final PhoneVerificationFailed veriFailed = (AuthException exception) {
//      print('${exception.message}');
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: this.phoneNo,
//        codeAutoRetrievalTimeout: autoRetrieve,
//        codeSent: smsCodeSent,
//        timeout: const Duration(seconds: 5),
//        verificationCompleted: verifiedSuccess,
//        verificationFailed: veriFailed);
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
//            contentPadding: EdgeInsets.all(10.0),
//            actions: <Widget>[
//              new FlatButton(
//                child: Text('Done'),
//                onPressed: () {
//                  FirebaseAuth.instance.currentUser().then((user) {
//                    if (user != null) {
//                      Navigator.of(context).pop();
//                      Navigator.of(context).pushReplacementNamed('/homepage');
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
//  signIn() {
//    FirebaseAuth.instance
//        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
//        .then((user) {
//      Navigator.of(context).pushReplacementNamed('/homesig');
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('PhoneAuth'),
//      ),
//      body: new Center(
//        child: Container(
//            padding: EdgeInsets.all(25.0),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                TextField(
//                  decoration: InputDecoration(hintText: 'Enter Phone number'),
//                  onChanged: (value) {
//                    this.phoneNo = value;
//                  },
//                ),
//                SizedBox(height: 10.0),
//                RaisedButton(
//                    onPressed: verifyPhone,
//                    child: Text('Verify'),
//                    textColor: Colors.white,
//                    elevation: 7.0,
//                    color: Colors.blue)
//              ],
//            )),
//      ),
//    );
//  }
//}



//here is the final code


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:uiux/utility/_navigator.dart';

import 'home.dart';


class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter OTP'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Sign Up'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }


  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );

      final FirebaseUser user = (await  _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Sign UP"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
           child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text('Hello',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                child: Text('There',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                child: Text('.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
              ],
           ),
        ),
             Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
               child: Column(
                  children: <Widget>[
                   TextField(
                decoration: InputDecoration(
                    labelText: "Enter Phone Number Eg. +910000000000",
                    labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(
                            color: Colors.blueGrey
                        )
                    )
                ),
                onChanged: (value) {
                  this.phoneNo = value;
                },
//                keyboardType: TextInputType.text,
                style: new TextStyle(
                    color: Colors.blueGrey
                ),
              ),
                   (errorMessage != ''
                       ? Text(
                     errorMessage,
                     style: TextStyle(color: Colors.red),
                          )
                       : Container()),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            verifyPhone();
                          },
//                        onTap:(){Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => Home()),

                          child: Center(
                            child: Text(
                              'Verify Phone',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),

          ],
        ),
      ),
    ],
      ),
    );
  }
}
