
import 'package:flutter/cupertino.dart';
import 'package:uiux/pages/home.dart';
import 'package:uiux/pages/intro.dart';


enum AuthStatus{
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
//     get the state, chk current user, set auth state based on state


  }


  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch(_authStatus){
      case AuthStatus.notLoggedIn:
        retVal = IntroScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = Home();
        break;
      default:
    }
    return retVal;

    return Container();
  }
}
