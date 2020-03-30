import 'dart:async';

import 'package:flutter/material.dart';
import 'package:relationship_management/src/blocs/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _errorMessage;
  bool get _hasError => _errorMessage != null;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() async {
    Timer(const Duration(milliseconds: 1000), () {
      _gotoNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SplashScreen',
        style: TextStyle(
          decoration: TextDecoration.none
        ),
      ),
    );
  }

  void _gotoNextScreen() async {
    try {
      final result = await AuthBloc().signIn();
      if (result) {
      } else {
        setState(() {
          _errorMessage = '認証に失敗しました。';
        });
      }
    } on Exception catch (error) {
      print(error);
      setState(() {
        _errorMessage = '認証に失敗しました。';
      });
    }
  }
}

