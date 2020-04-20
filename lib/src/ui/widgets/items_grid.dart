import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/providers/filter_state.dart';
import 'package:relationship_management/src/ui/widgets/item_card.dart';

class ItemsGrid extends StatelessWidget {
  final bool showOpenItems;
  ItemsGrid(this.showOpenItems);

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> items;
    return Consumer<QuerySnapshot>(builder: (context, itemsData, child) {
      if (Provider.of<FilterState>(context).filterEnabled)
        items = itemsData.documents
          .where((doc) =>
              doc['name'] == Provider.of<FilterState>(context).nameFilter)
          .toList();
      else
        items = itemsData.documents;

      if (items.length > 0)
        return Column(
          children: <Widget>[
            AnimationLimiter(
              child: Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                    padding: EdgeInsets.all(8.0),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: ItemCard(
                                item: items[index],
                              ),
                            ),
                          ),
                      );
                    }
                ),
              ),
            )
          ],
        );
      else
        return Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Text('最近知り合った人はいませんか? 登録してみましょう。'),
              Image(
                image: AssetImage('assets/images/Browsing.png')
              ),
            ],
          ),
        );
    });
  }
}
