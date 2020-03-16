import 'package:flutter/material.dart';

class CategoryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 350,
        height: 150,
        color: Colors.grey.withOpacity(0.2),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('All',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          color: Colors.blue
                      ),
                    ),
                    SizedBox(height: 70, width: 50),
                    Text('15 people',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          color: Colors.blue
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

