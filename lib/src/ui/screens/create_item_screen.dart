import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/create_item_form.dart';

class CreateItemScreen extends StatelessWidget {
  static const String routeName = 'create_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'New Item',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Center(child: CreateItemForm()),
    );
  }
}
