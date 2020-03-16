import 'package:flutter/material.dart';

class CategoryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 370,
        height: 120,
        color: Colors.blueGrey.withOpacity(0.1),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text('All',
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 30, width: 30),
            Container(
              padding: EdgeInsets.only(top: 10, right: 170),
              child: Text('15 people',
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF262AAA),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

