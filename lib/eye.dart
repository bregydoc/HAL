import 'dart:async';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:hal/eyebase.dart';

class IrisPosition {
  static double top = 0.0;
  static double bottom = 0.0;
  static double left = 0.0;
  static double right = 0.0;
}

class Eye extends StatefulWidget {
  final double _size;
  final Function _callback;
  Eye(this._size, this._callback);

  @override
  _EyeState createState() => _EyeState();
}

class _EyeState extends State<Eye> {
  final double _finalOpacity = 1.0;
  final Random rand = Random(DateTime.now().millisecondsSinceEpoch);

  double currentOpacity = 1.0;
  int currentDurationInMilliseconds = 100;
  int blinkInSeconds = 1000;
  Timer timer;

  _EyeState() {
    blinkInSeconds = (rand.nextDouble() * 10).toInt() + 2;
    print(blinkInSeconds);
    timer = Timer(Duration(seconds: blinkInSeconds), () {
      this.setState(() {
        this._calculateRandomBlink();
      });
    });
  }

  void _calculateRandomBlink() {
    currentDurationInMilliseconds = (rand.nextDouble() * 90).toInt() + 10;
    currentOpacity = rand.nextDouble();
    blinkInSeconds = (rand.nextDouble() * 10).toInt() + 2;

    // print("blinkInSeconds: $blinkInSeconds");
    // print("currentOpacity: $currentOpacity");
    // print("currentDurationInMilliseconds: $currentDurationInMilliseconds");

    Timer(Duration(milliseconds: currentDurationInMilliseconds + 10), () {
      this.setState(() {
        currentDurationInMilliseconds = 10;
        currentOpacity = _finalOpacity;
      });
    });

    timer = Timer(Duration(seconds: blinkInSeconds), () {
      this.setState(() {
        this._calculateRandomBlink();
      });
    });
  }

  void moveToRight() {
    this.setState(() {
      IrisPosition.right = 0.0;
      IrisPosition.left = 50.0;
    });
  }

  void moveToLeft() {
    this.setState(() {
      IrisPosition.left = 0.0;
      IrisPosition.right = 50.0;
    });
  }

  void moveToTop() {
    this.setState(() {
      IrisPosition.bottom = 0.0;
      IrisPosition.top = 50.0;
    });
  }

  void moveToBottom() {
    this.setState(() {
      IrisPosition.top = 0.0;
      IrisPosition.bottom = 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._callback,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          EyeBase(widget._size),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: IrisPosition.top,
            bottom: IrisPosition.bottom,
            left: IrisPosition.left,
            right: IrisPosition.right,
            child: AnimatedOpacity(
              opacity: currentOpacity,
              duration: Duration(milliseconds: currentDurationInMilliseconds),
              child: EyeIris(widget._size * 0.2),
            ),
          )
        ],
      ),
    );
  }
}
