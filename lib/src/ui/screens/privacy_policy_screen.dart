import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String roteName = '/privacy_policy';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'PrivacyPolicy',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
