import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relationship Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFE672E),
        accentColor: Color(0xFFFEE0D5),
      ),
      home: HomeScreen(),
    );
  }
}