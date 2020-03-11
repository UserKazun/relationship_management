import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Home ...',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

