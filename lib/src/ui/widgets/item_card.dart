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
        color: Theme.of(context).cardColor,
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
                SizedBox(height: 10),
                Text(
                  this.item['name'],
                  style: GoogleFonts.kosugiMaru(
                    textStyle: Theme.of(context).textTheme.headline5
                  ),
                ),
                Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)
                    ),
                  ),
                  label: Text(
                    '特徴',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      if (this.item['character'] != '')
                        Text(
                          '①${this.item['character']}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      if (this.item['character2'] != '')
                        Text(
                          '②${this.item['character2']}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      if (this.item['character3'] != '')
                        Text(
                          '③${this.item['character3']}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        timeago.format(this.item['time'].toDate()),
                        style: Theme.of(context).textTheme.headline4,
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
