import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;

  Category(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Text(
                title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 24,
                color: const Color(0xFF262AAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

