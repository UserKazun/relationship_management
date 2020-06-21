import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';

class ItemModal extends StatelessWidget {
  final DocumentSnapshot item;
  ItemModal({@required this.item});



  @override
  Widget build(BuildContext context) {
    double getDeviceWidth() {
      double deviceWidth;
      if (MediaQuery.of(context).size.width < 700) {
        deviceWidth = MediaQuery.of(context).size.width + 100;
        return deviceWidth;
      } else {
        deviceWidth = MediaQuery.of(context).size.width - 100;
        return deviceWidth;
      }
    }

    return Center(
      child: Container(
        height: getDeviceWidth(),
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

                  SizedBox(height: 50),

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
