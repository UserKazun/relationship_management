import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:relationship_management/src/services/auth.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
        child: SpinKitDoubleBounce(
          color: Theme.of(context).primaryColor,
          size: 50.0,
        ),
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
                    'App Name',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'App Description',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Theme.of(context).primaryColor),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Browsing.png')
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
