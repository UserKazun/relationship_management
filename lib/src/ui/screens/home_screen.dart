import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';
import 'package:relationship_management/src/ui/screens/item_create_screen.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/screens/welcome.dart';
import 'package:relationship_management/src/ui/widgets/items_container.dart';

class HomeScreen extends StatelessWidget {
  static const String home = 'home_screen';
  final String uid;

  HomeScreen(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                _showSignOutDialog(context);
              },
            ),
          ),
          SafeArea(
            child: MultiProvider(
              providers: [
                StreamProvider<QuerySnapshot>(
                  create: (context) => ItemsController.getUserItems(this.uid),
                ),
              ],
              child: ItemsContainer(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool flag = await Auth.isEmailVerified();
          if (flag)
            Navigator.pushNamed(context, ItemCreateScreen.routeName);
          else
            _showEmailConfirmDialog(context);
        },
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Color(0xFFE0E5EC),
      ),
    );
  }
}

void _showEmailConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Platform.isIOS) {
        return CupertinoAlertDialog(
          title: Text('メールアドレスの確認が必要です。'),
          content: Text('確認してください。'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('完了'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('もう一度送信'),
              onPressed: () {
                Auth.sendEmailVerification();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } else
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('メールアドレスの確認が必要です。'),
          content: Text('確認してください。'),
          actions: <Widget>[
            FlatButton(
              child: Text('完了'),
              textColor: Colors.black87,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('もう一度送信'),
              textColor: Colors.black87,
              onPressed: () {
                Auth.sendEmailVerification();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
    }
  );
}

void _showSignOutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('ログアウトしますか？'),
          content: Text('データは消えません。'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('ログアウト'),
              onPressed: () {
                Auth.signOut();
                Navigator.pushReplacementNamed(context, Welcome.routeName);
              },
            ),
          ],
        );
      }
  );
}
