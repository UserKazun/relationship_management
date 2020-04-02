import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
    );
  }
}
