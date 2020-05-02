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
    // String displayItemSum = this.item['name'];
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    String formattedDateOpened =
        formatter.format(DateTime.parse(this.item['time'].toDate().toString()));

    return Center(
      child: Container(
        height: 450,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  this.item['categoryKey'] == true
                      ? '${this.item['categoryKey']}'
                      : '',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.item['name'],
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    Text(
                      '$formattedDateOpened',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '趣味',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    // todo: ボタン化する
                    Icon(
                        Icons.star
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${this.item['hobby']}',
                    ),
                  ],
                ),

                SizedBox(height: 77),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 190,
                    child: Image(
                      image: AssetImage(
                          'assets/images/HandsUp.png'
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 83,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.50, 18
                        ),
                        topRight: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.50, 18
                        ),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                            '編集'
                        ),
                        onPressed: () {
                          // todo: 予めデータがある場合の編集画面を作る
                        },
                      ),

                      SizedBox(width: 30),

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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
