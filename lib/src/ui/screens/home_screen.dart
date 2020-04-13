import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationship_management/src/controllers/items_controller.dart';
import 'package:relationship_management/src/ui/screens/item_create_screen.dart';
import 'package:relationship_management/src/ui/screens/menu_screen.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/widgets/items_container.dart';

class HomeScreen extends StatelessWidget {
  static const String home = 'home_screen';
  final String uid;

  HomeScreen(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: Stack(
        children: <Widget>[
          Container(
            height: 225,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                stops: [0.1, 0.6],
                colors: [
                  Theme.of(context).primaryColor.withGreen(190),
                  Theme.of(context).primaryColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.50, 18
                ),
                bottomRight: Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.50, 18
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pushNamed(MenuScreen.routeName);
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
          )
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
        child: Icon(Icons.add),
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
            )
          ],
        );
    }
  );
}