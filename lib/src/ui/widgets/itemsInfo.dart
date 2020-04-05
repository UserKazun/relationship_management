import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsInfo extends StatelessWidget {
  final List<DocumentSnapshot> items;

  ItemsInfo(this.items);

  String getAllItemCount(
      List<DocumentSnapshot> items) {
    int allItem = 0;
    for (DocumentSnapshot item in items) {
      if (item['categoryKey'] == '全て')
        allItem += item['全て'];
    }
    return allItem.toString();
  }

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
