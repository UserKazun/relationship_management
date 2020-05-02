import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/providers/filter_state.dart';

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
    if (items.length == 1) {
      String text = '${items.length} person';
      return text;
    } else {
      String text = '${items.length} people';
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
        Provider.of<FilterState>(context).filterEnabled || items.length == 0
            ? 125
            : 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: items.length > 0
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Home',
            style: Theme.of(context).textTheme.title,
          ),
          Spacer(),
          SizedBox(
            height: 10,
          ),
          Text(
            getHeaderText(items),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // todo: カテゴリーわけ
        ],
      ),
    );
  }
}
