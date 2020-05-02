import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relationship_management/src/ui/widgets/item_modal.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemCard extends StatelessWidget {
  final DocumentSnapshot item;
  ItemCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA3B1C6),
            spreadRadius: -3.0,
            blurRadius: 10.0,
            offset: Offset(2.0, 2.0)
          ),
          BoxShadow(
              color: Colors.white,
              spreadRadius: -3.0,
              blurRadius: 10.0,
              offset: Offset(-2.0, -2.0)
          )
        ]
      ),
      child: Card(
        color: Color(0xFFE0E5EC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => ItemModal(
                item: this.item,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.item['categoryKey'],
                ),
                Text(
                  this.item['name'],
                  style: GoogleFonts.kosugiMaru(
                    textStyle: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)
                    ),
                  ),
                  label: Text(
                    '特徴'
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        timeago.format(this.item['time'].toDate()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
