import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('メニュー'),
            automaticallyImplyLeading: false,
          ),
          Divider(),

          // todo: email sign in button
          // todo: google sign in button

          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('プライバシーポリシー'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.pan_tool),
            title: Text('使い方'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('ログアウト'),
          )
        ],
      ),
    );
  }
}

