import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';

class CreateItemForm extends StatefulWidget {
  @override
  _CreateItemFormState createState() => _CreateItemFormState();
}

class _CreateItemFormState extends State<CreateItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _pageViewController = PageController();
  final _textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<Widget> _pages;
  double _formProgress = 0.15;

  @override
  void initState() {
    super.initState();
  }

  void _submitItem() {
    ItemsController.createItem(
      name: _textControllers[0].text,
      gender: _textControllers[1].text,
      character: _textControllers[2].text,
      character2: _textControllers[3].text,
      character3: _textControllers[4].text,
      hobby: _textControllers[5].text,
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
    Widget choiceChip,
    List<String> categoryKeys,
  }) {

    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 12),

          Row(
            children: <Widget>[
              Flexible(child: textField),
              if (option != null) option,
            ],
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
                  RaisedButton(
                    child: Text(pageIndex == 5 ? '追加' : '次へ'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (pageIndex == 5) {
                          _submitItem();
                        } else {
                          goNext();
                        }
                      }
                    },
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
            if (value.length > 10) {
              return 'お相手のお名前は10文字以下で入力してください。';
            } else if (value.isEmpty) {
              return 'お相手のお名前を10文字以下で入力してください。';
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
        description: 'お相手の1つ目の特徴を入力してください。',
        textField: TextFormField(
          controller: _textControllers[2],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.face)),
        ),
      ),

      buildPage(
        pageIndex: 3,
        title: '特徴',
        description: 'お相手の2つ目の特徴を入力してください。',
        textField: TextFormField(
          controller: _textControllers[3],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.face)),
        ),
      ),

      buildPage(
        pageIndex: 4,
        title: '特徴',
        description: 'お相手の3つ目の特徴を入力してください。',
        textField: TextFormField(
          controller: _textControllers[4],
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          decoration: InputDecoration(prefixIcon: Icon(Icons.face)),
        ),
      ),

      buildPage(
          pageIndex: 5,
          title: '趣味',
          description: 'お相手の趣味を入力してください。',
          textField: TextFormField(
            controller: _textControllers[5],
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            decoration: InputDecoration(prefixIcon: Icon(Icons.audiotrack)),
            validator: (value) {
              if (value.length < 2) {
                return '趣味は最低2文字で入力してください。';
              }
              return null;
            },
          ),
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
            child: StreamBuilder(
              builder: (context, __) => PageView(
                controller: _pageViewController,
                physics: NeverScrollableScrollPhysics(),
                children: buildPages(
                  context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
