import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';
import 'package:relationship_management/src/ui/screens/item_create_screen.dart';
import 'package:relationship_management/src/ui/screens/login_screen.dart';
import 'package:relationship_management/src/ui/screens/menu_screen.dart';

import 'services/auth.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relationship Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF369FFF),
        accentColor: Color(0xFFFEE0D5),
      ),
      routes: {
        MenuScreen.routeName: (_) => MenuScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ItemCreateScreen.routeName: (_) => ItemCreateScreen(),
      },
      home: FutureBuilder<FirebaseUser>(
        future: Auth.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.done) {
            if (userSnapshot.error != null) {
              print('error');
              return Text(userSnapshot.error.toString());
            }
            return userSnapshot.hasData
                ? HomeScreen(userSnapshot.data.uid)
                : LoginScreen();
          } else {
            return Text(
                'relationship_management'
            );
          }
        },
      ),
    );
  }
}
