import 'package:flutter/material.dart';

import '../widgets/category_info.dart';
import '../widgets/category_selector.dart';
import '../widgets/person.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF262AAA),
      child: Row(
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
                    color: Colors.white
                  ),
                ),
                CategoryInfo(),
                CategorySelector(),
                Person(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
