
import 'package:flutter/material.dart';

import 'package:uiux/utility/_navigator.dart';
import 'package:uiux/utility/text_cards.dart';
import 'package:uiux/widgets/slides.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAF8F8),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Senitize.wt1,
                  content: Senitize.wc1,
                  imageIcon: Icons.mobile_screen_share,
                  
                 
                ),
                Walkthrough(
                  title: Senitize.wt2,
                  content: Senitize.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: Senitize.wt3,
                  content: Senitize.wc3,
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: Senitize.wt4,
                  content: Senitize.wc4,
                  imageIcon: Icons.verified_user,
                  
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Senitize.skip,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                  lastPage ? null : MyNavigator.goTosignup(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Senitize.gotIt : Senitize.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goTosignup(context)
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}