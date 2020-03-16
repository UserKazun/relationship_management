import 'package:flutter/material.dart';

import 'category.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category('all'),
          Category('latest'),
          Category('job'),
          Category('matching'),
          Category('private'),
        ],
      ),
    );
  }
}
