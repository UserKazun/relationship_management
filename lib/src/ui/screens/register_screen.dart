import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_screen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
            Text(
              'Create account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 80,),
            Container(
              padding: EdgeInsets.all(15.0),
              height: 230,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    spreadRadius: -2.0,
                    blurRadius: 12.0,
                    offset: Offset(6.0, 6.0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -2.0,
                    blurRadius: 12.0,
                    offset: Offset(-6.0, -6.0),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'mail address';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
