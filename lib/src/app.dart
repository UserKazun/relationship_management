import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/home_screen.dart';
import 'package:relationship_management/src/ui/screens/item_create_screen.dart';
import 'package:relationship_management/src/ui/screens/register_screen.dart';
import 'package:relationship_management/src/ui/screens/signin_screen.dart';
import 'package:relationship_management/src/ui/screens/welcome.dart';
import 'package:relationship_management/src/ui/screens/menu_screen.dart';

import 'services/auth.dart';

class App extends StatelessWidget {
  final Color primaryColor = Color(0xFF369FFF);
  final Color accentColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relationship Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        backgroundColor: Color(0xFFE0E5EC),
        cardColor: Color(0xFFE0E5EC),
        buttonColor: Color(0xFFE0E5EC),
        scaffoldBackgroundColor: Color(0xFFE0E5EC),
        appBarTheme: AppBarTheme(color: Color(0xFFE0E5EC)),
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          subtitle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
          button: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFE0E5EC),
          textTheme: ButtonTextTheme.normal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(8),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      routes: {
        Welcome.routeName: (_) => Welcome(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        ItemCreateScreen.routeName: (_) => ItemCreateScreen(),
        MenuScreen.routeName: (_) => MenuScreen()
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
                : Welcome();
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
