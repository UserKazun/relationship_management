import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/providers/filter_state.dart';

class ItemsInfo extends StatelessWidget {
  final List<DocumentSnapshot> items;

  ItemsInfo(this.items);

  String getHeaderText(List<DocumentSnapshot> items) {
    String text = '${items.length} 人';

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
        Provider.of<FilterState>(context).filterEnabled || items.length == 0
            ? 125
            : 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: items.length > 0
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Home',
            style: Theme.of(context).textTheme.headline2,
          ),
          Spacer(),
          SizedBox(
            height: 10,
          ),
          Text(
            getHeaderText(items),
            style: Theme.of(context).textTheme.headline3
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
