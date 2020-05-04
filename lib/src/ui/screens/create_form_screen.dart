import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';
import 'package:relationship_management/src/providers/category_key_state.dart';

class CreateFormScreen extends StatefulWidget {
  @override
  _CreateFormScreenState createState() => _CreateFormScreenState();
}

class _CreateFormScreenState extends State<CreateFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pageViewController = PageController();
  final _textControllers = [
    TextEditingController(),
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
      categoryKey: '',
      name: _textControllers[0].text,
      gender: _textControllers[1].text,
      character: _textControllers[2].text,
      hobby: _textControllers[3].text,
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
    Widget textField,
    Widget option,
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

          Container(
            child: Row(
              children: <Widget>[
                Flexible(child: textField),
                if (option != null) option,
              ],
            ),
          ),

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
                      child: Text(pageIndex == 3 ? '追加' : '次へ'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (pageIndex == 3) {
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
        title: 'お名前',
        description: 'お相手のお名前を入力してください。',
        textField: TextFormField(
          controller: _textControllers[0],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
          validator: (value) {
            if (value.length < 10) {
              return 'Name must be at least 10 characters';
            }
            return null;
          },
        ),
      ),
      buildPage(
        pageIndex: 1,
        title: '性別',
        description: 'お相手の性別を入力してください。',
        textField: TextFormField(
          controller: _textControllers[1],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.accessibility_new)),
        ),
      ),

      buildPage(
          pageIndex: 2,
          title: '特徴',
          description: 'お相手の特徴を入力してください。',
          textField: TextFormField(
            controller: _textControllers[2],
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            decoration: InputDecoration(prefixIcon: Icon(Icons.face)),
          ),
        // todo: 特徴の候補を表示
      ),

      buildPage(
          pageIndex: 3,
          title: '趣味',
          description: 'お相手の趣味を入力してください。',
          textField: TextFormField(
            controller: _textControllers[3],
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            decoration: InputDecoration(prefixIcon: Icon(Icons.audiotrack)),
          ),
        // todo: 趣味の候補を表示
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
