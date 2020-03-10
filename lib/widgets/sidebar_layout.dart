import 'package:flutter/material.dart';

import './sidebar.dart';

class SideBarlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HomePage(),
        SideBar(),
      ],
    );
  }
}

