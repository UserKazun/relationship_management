import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['全て', '最近', 'お気に入り', '仕事', 'プライベート'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      // color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22.0,
                  vertical: 15.0
                ),
                child: Text(
                    categories[index],
                  style: TextStyle(
                    color: index == selectedIndex ? Colors.blueGrey : Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
