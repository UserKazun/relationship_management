import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSidebarOpened ? 0 : 0,
      right: isSidebarOpened ? 0 : screenWidth - 45,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color(0xFF262AAA),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: Container(
              width: 35,
              height: 110,
              color: Color(0xFF262AAA),
            ),
          ),
        ],
      ),
    );
  }
}

