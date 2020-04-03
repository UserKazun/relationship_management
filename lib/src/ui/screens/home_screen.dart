import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/widgets/app_drawer.dart';
import 'package:relationship_management/src/ui/widgets/category_info.dart';
import 'package:relationship_management/src/ui/widgets/category_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          CategoryInfo(),
          CategorySelector(),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
