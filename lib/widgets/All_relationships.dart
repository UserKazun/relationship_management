import 'package:flutter/material.dart';

import '../models/persons.dart';

class AllRelationships extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ListView.builder(
            itemCount: persons.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(favorites[index].imageUrl),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              persons[index].name,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            persons[index].birthday,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        persons[index].hobby
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
    );
  }
}

