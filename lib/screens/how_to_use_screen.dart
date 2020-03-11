import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'How to use ...',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
