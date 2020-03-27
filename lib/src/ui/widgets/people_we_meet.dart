import 'package:flutter/material.dart';

class PeopleWeMeet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('People we meet',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(
                    Icons.more_horiz
                ),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {

                },
              ),
            ],
          ),
        ),
        Container(
          height: 120.0,
          color: Colors.white,
        ),
      ],
    );
  }
}

