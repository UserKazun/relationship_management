import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';

class ItemModal extends StatelessWidget {
  final DocumentSnapshot item;
  ItemModal({@required this.item});

  @override
  Widget build(BuildContext context) {
    String displayItemSum = this.item['name'];
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    String formattedDateOpened =
        formatter.format(DateTime.parse(this.item['time'].toDate().toString()));

    return Container(
      height: 450,
      margin: EdgeInsets.only(left: 18, right: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              this.item['categoryKey'] == true
                  ? '${this.item['categoryKey']}'
                  : '',
            ),
            Text(
              '$formattedDateOpened',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'hobby'
                  ),
                  // todo: conversion bottom
                  Icon(
                      Icons.star
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${this.item['hobby']}',
                ),
              ],
            ),
            Expanded(
              child: Text(
                'Image'
              ),
            ),
            // fit: BoxFit.contain,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    '編集'
                  ),
                  onPressed: () {

                  },
                ),
                RaisedButton(
                  child: Text(
                    '削除'
                  ),
                  onPressed: () {
                    ItemsController.deleteItem(this.item.documentID);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
