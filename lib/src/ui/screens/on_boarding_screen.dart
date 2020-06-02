import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relationship_management/src/ui/screens/welcome.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/on_boarding";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _formKey = GlobalKey<FormState>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.black,
        borderRadius: BorderRadius.circular(12.0)
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //mySliders = getSlider();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              _SlideTile(
                imagePath: "assets/images/Character.png",
                title: "ようこそ",
                desc: "説明文",
              ),
              _SlideTile(
                imagePath: "assets/images/Teamwork.png",
                title: "タイトル",
                desc: "説明文",
              ),
              _SlideTile(
                imagePath: "assets/images/people_in_couple.png",
                title: "タイトル",
                desc: "説明文",
              ),
            ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.animateToPage(
                      2,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear
                  );
                },
                splashColor: Colors.blue,
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.button
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < 3; i++) i == slideIndex
                        ? _buildPageIndicator(true)
                        : _buildPageIndicator(false)
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  controller.animateToPage(
                      slideIndex + 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear
                  );
                },
                splashColor: Colors.blue,
                child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.button
                ),
              ),
            ],
          ),
        ) : InkWell(
          onTap: () {
            Navigator.pushNamed(context, Welcome.routeName);
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "START",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        )
      ),
    );
  }
}

class _SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  _SlideTile({
    this.imagePath,
    this.title,
    this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

