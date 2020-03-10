import 'package:flutter/material.dart';

import './sidebar.dart';
import '../screens/privacy_policy_screen.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PrivacyPolicyScreen(),
        SideBar(),
      ],
    );
  }
}

