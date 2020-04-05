import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';
import 'package:relationship_management/src/ui/screens/menu_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relationship Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF369FFF),
        accentColor: Color(0xFFFEE0D5),
      ),
      home: HomeScreen(),
      routes: {
        MenuScreen.menu: (_) => MenuScreen()
      },
    );
  }
}
