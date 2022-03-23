
import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/profile.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  color: Color(0xFF37474F),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 40, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  iconSize: 40, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Profile()),
                  );
                }
                ),
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width - 10,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: Color(0xFF263238),
        ),
      ),
    );
  }
}