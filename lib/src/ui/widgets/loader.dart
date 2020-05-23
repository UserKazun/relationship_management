import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final Color color;
  final Duration duration;

  Loader({
    this.color = Colors.black,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;
  Animation<double> animation_4;
  Animation<double> animation_5;
  Animation<double> animation_6;
  Animation<double> animation_7;
  Animation<double> animation_8;
  Animation<double> animation_9;
  Animation<double> animation_10;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    animation_4 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 1.00, curve: Curves.linear),
      ),
    );

    animation_5 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 1.10, curve: Curves.linear),
      ),
    );

    animation_6 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.20, curve: Curves.linear),
      ),
    );

    animation_7 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.30, curve: Curves.linear),
      ),
    );

    animation_8 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1.40, curve: Curves.linear),
      ),
    );

    animation_9 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.8, 1.50, curve: Curves.linear),
      ),
    );

    animation_10 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.9, 1.60, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {

      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: (animation_1.value <= 0.4
                ? 2.5 * animation_1.value
                : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_1.value)),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _Item(
                text: 'L',
                color: widget.color,
              ),
            ),
          ),
          Opacity(
            opacity: (animation_2.value <= 0.4
                ? 2.5 * animation_2.value
                : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_2.value)),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _Item(
                text: 'o',
                color: widget.color,
              ),
            ),
          ),
          Opacity(
            opacity: (animation_3.value <= 0.4
                ? 2.5 * animation_3.value
                : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_3.value)),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _Item(
                text: 'a',
                color: widget.color,
              ),
            ),
          ),
          Opacity(
            opacity: (animation_1.value <= 0.4
                ? 2.5 * animation_1.value
                : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_1.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: _Item(
                  text: 'd',
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_2.value <= 0.4
                ? 2.5 * animation_2.value
                : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_2.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: _Item(
                  text: 'i',
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_3.value <= 0.4
                ? 2.5 * animation_3.value
                : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_3.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: _Item(
                  text: 'n',
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_1.value <= 0.4
                ? 2.5 * animation_1.value
                : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_1.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _Item(
                  text: 'g',
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_2.value <= 0.4
                ? 2.5 * animation_2.value
                : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_2.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _Dot(
                  radius: 5.0,
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_3.value <= 0.4
                ? 2.5 * animation_3.value
                : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_3.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _Dot(
                  radius: 5.0,
                  color: widget.color,
                ),
            ),
          ),
          Opacity(
            opacity: (animation_1.value <= 0.4
                ? 2.5 * animation_1.value
                : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                ? 1.0
                : 2.5 - (2.5 * animation_1.value)),
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _Dot(
                  radius: 5.0,
                  color: widget.color,
                ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _Item extends StatelessWidget {
  final String text;
  final Color color;

  _Item({
    this.text,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0.0,
        child: Container(
          width: 30,
          height: 30,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final double radius;
  final Color color;

  _Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0.0,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
