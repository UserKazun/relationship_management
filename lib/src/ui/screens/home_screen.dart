import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: Stack(
        children: <Widget>[
          Container(
            height: 225,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                stops: [0.1, 0.6],
                colors: [
                  Theme.of(context).primaryColor.withGreen(190),
                  Theme.of(context).primaryColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.50, 18
                ),
                bottomRight: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.50, 18
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pushNamed(MenuScreen.menu);
              },
            ),
          ),
        ],
      ),
    );
  }
}
