import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Color(0xFF262AAA),
          ),
        ),
        Container(
          width: 35,
          height: 110,
        )
      ],
    );
  }
}

