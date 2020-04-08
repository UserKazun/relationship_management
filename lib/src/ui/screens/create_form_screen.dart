import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/controllers/itemsController.dart';
import 'package:relationship_management/src/providers/category_key_state.dart';

class CreateForm extends StatefulWidget {
  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _pageViewController = PageController();
  final _textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<Widget> _pages;
  double _formProgress = 0.15;
  // bool userOwesFriend = false;

  @override
  void initState() {
    super.initState();
  }

  void _submitItem() {
    ItemsController.createItem(
      name: _textControllers[0].text,
      // todo: DatePicker
      birthday: _textControllers[1].text,
      hobby: _textControllers[2].text,
    );
    Navigator.pop(context);
  }

  void goBack() {
    _formProgress -= 1 / _pages.length;
    _pageViewController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
    );
    FocusScope.of(context).unfocus();
  }

  void goNext() {
    _formProgress += 1 / _pages.length;
    _pageViewController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
    );
    FocusScope.of(context).unfocus();
  }

  Widget buildPage({
    @required int pageIndex,
    @required String title,
    @required String description,
    @required Widget textField,
    CategoryKeyState categoryKeyState,
    List<String> categoryKeys,
  }) {
    List<Widget> generateCategoryKey() {
      if (categoryKeys == null) return [];
      List<Widget> chips = [];
      for (String categoryKey in categoryKeys) {
        chips.add(Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ActionChip(
            label: Text(categoryKey),
            backgroundColor: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(8)
              ),
            ),
            onPressed: () {
              _textControllers[pageIndex].text = categoryKey;
            },
          ),
        ));
      }
      return chips;
    }

    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
          Text(description),
          if (categoryKeys != null && categoryKeys.length > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: AnimationLimiter(
                    child: Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: AnimationConfiguration.toStaggeredList(
                            delay: Duration(milliseconds: 150),
                            duration: Duration(milliseconds: 200),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 70.0,
                              child: FadeInAnimation(
                                duration: Duration(milliseconds: 300),
                                child: widget,
                              ),
                            ),
                            children: generateCategoryKey(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 12),

          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(pageIndex == 0 ? 'キャンセル' : '戻る'),
                    onPressed: () {
                      if (pageIndex == 0) {
                        Navigator.pop(context);
                      } else {
                        goBack();
                      }
                    },
                  ),
                  Consumer<CategoryKeyState>(
                    builder: (_, categoryKeyState, __) => RaisedButton(
                      child: Text(pageIndex == 2 ? '追加' : '次へ'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (pageIndex == 2) {
                            _submitItem();
                            categoryKeyState.updateCategoryKey(
                                _textControllers[1].text
                            );
                          } else {
                            goNext();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildPages(
      BuildContext context,
      CategoryKeyState categoryKeyState,
  ) {
    _pages = [
      buildPage(
        pageIndex: 0,
        title: 'カテゴリー',
        description: 'お相手の名前を入力してください。',
        textField: TextFormField(
          controller: _textControllers[0],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.vpn_key)),
        ),
        categoryKeyState: categoryKeyState,
        categoryKeys: categoryKeyState.categoryKey['categoryKey'],
      ),
    ];
    return _pages;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          LinearProgressIndicator(
            value: _formProgress,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor)),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => CategoryKeyState(),
              child: Consumer<CategoryKeyState>(
                builder: (context, categoryKeyState, __) => PageView(
                  controller: _pageViewController,
                  physics: NeverScrollableScrollPhysics(),
                  children: buildPages(
                    context,
                    categoryKeyState,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
