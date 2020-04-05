import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SignInButton(
          Buttons.Google,
          onPressed: () async {
            setState(() => loading = true);
            final user = await Auth.googleSignIn();
            setState(() => loading = false);
            if (user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(user)),
                  ModalRoute.withName('/'));
            }
          },
        ),
      ],
    );
  }
}
