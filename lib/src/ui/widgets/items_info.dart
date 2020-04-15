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
      if (item['categoryKey'] == '')
        allItem += item['categoryKey'];
    }
    return allItem.toString();
  }

  String getHeaderText(List<DocumentSnapshot> items) {
    String text = '${items.length} 人';
    if (items.length != 1) text += '人々';

    return text;
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
