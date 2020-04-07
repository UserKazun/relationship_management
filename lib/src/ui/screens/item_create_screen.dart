import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCreateScreen extends StatelessWidget {
  static const String routeName = 'create_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Item')),
      body: Text('test'),
    );
  }
}
