import 'package:flutter/material.dart';
import 'package:relationship_management/models/persons_model.dart';

class FavoriteRelationships extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Favorite Relationship',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                icon: Icon(
                    Icons.more_horiz
                ),
                iconSize: 30.0,
                color: Colors.blueGrey,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 120.0,
          color: Colors.blue,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(favorites[index].imageUrl),
                    ),
                    Text(favorites[index].name),
                  ],
                );
              },
          ),
        ),
      ],
    );
  }
}

