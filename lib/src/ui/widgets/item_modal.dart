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
        height: MediaQuery.of(context).size.height - 260,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.item['name'],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '趣味',
                        style: Theme.of(context).textTheme.bodyText2
                      ),
                      Text(
                        '性格',
                          style: Theme.of(context).textTheme.bodyText2
                      ),
                    ],
                  ),

                  SizedBox(height: 5),

                  Row(
                    children: <Widget>[
                      Text(
                        '${this.item['hobby']}',
                        style: Theme.of(context).textTheme.bodyText1
                      ),

                      SizedBox(width: 197),

                      Column(
                        children: <Widget>[
                          if (this.item['character'] != '')
                            Text(
                              '①${this.item['character']}',
                              style: Theme.of(context).textTheme.headline5
                            ),
                          if (this.item['character2'] != '')
                            Text(
                              '②${this.item['character2']}',
                                style: Theme.of(context).textTheme.headline5
                          ),
                          if (this.item['character3'] != '')
                            Text(
                              '③${this.item['character3']}',
                                style: Theme.of(context).textTheme.headline5
                          ),
                        ],
                      ),
                    ],
                  ),

                  Image(
                    image: AssetImage(
                      'assets/images/HandsUp.png'
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


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
          ],
        ),
      ),
    );
  }
}
