import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/screens/welcome.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Menu'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('プライバシーポリシー'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('ログアウト'),
              onTap: () {
                _showSignOutDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }
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
