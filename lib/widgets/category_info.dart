import 'package:flutter/material.dart';

class CategoryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      color: Colors.grey.withOpacity(0.2),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50, 
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Text('15 people')
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}

