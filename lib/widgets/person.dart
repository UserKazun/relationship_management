import 'package:flutter/material.dart';

import 'people_we_meet.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                PeopleWeMeet(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
