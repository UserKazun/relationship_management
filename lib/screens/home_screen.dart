import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
        ],
      ),
    );
  }
}
