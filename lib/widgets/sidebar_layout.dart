import 'package:flutter/material.dart';

import './sidebar.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/home_screen.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomeScreen(),
          SideBar(),
        ],
      ),
    );
  }
}

