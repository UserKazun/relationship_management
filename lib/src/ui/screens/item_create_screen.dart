import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/create_form_screen.dart';

class ItemCreateScreen extends StatelessWidget {
  static const String routeName = 'create_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Item'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: CreateFormScreen()),
    );
  }
}
