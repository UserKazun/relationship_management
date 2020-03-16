import 'package:flutter/material.dart';

import '../widgets/category_info.dart';
import '../widgets/categories.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
              ),
              CategoryInfo(),
              Categories(),
            ],
          ),
        ),
      ],
    );
  }
}
