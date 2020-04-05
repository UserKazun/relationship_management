import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(12.0),
      child: Card(
        color: Color(0xFFE7EFB),
        child: Text('全て'),
      ),
    );
  }
}
