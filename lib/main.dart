import 'package:flutter/material.dart';
import 'package:relationship_management/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
