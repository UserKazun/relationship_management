import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';
import 'package:relationship_management/src/ui/screens/register_screen.dart';
import 'package:relationship_management/src/ui/screens/signin_screen.dart';
import 'package:relationship_management/src/ui/widgets/loader.dart';

class Welcome extends StatefulWidget {
  static const String routeName = "/welcome";

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
        child: Loader(),
      )
      : Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 100),
                  Image(
                      image: AssetImage('assets/images/Connect.png')
                  ),
                  Expanded(
                    child: Column(
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
                        if (Platform.isIOS)
                          SignInButton(
                            Buttons.AppleDark,
                            onPressed: () async {
                              setState(() => loading = true);
                              final user = await Auth.appleSignIn();
                              print(user);
                              setState(() => loading = false);
                              if (user != null)
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(user)),
                                    ModalRoute.withName('/')
                                );
                            },
                          ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  'OR',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.black))
                          ],
                        ),
                        RaisedButton(
                          child: Text('Create Account'),
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                        ),
                        FlatButton(
                          child: Text('Sign in'),
                          onPressed: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          },
                        ),
                      ],
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
}
