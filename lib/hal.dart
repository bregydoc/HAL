import 'package:flutter/material.dart';
import 'package:hal/console.dart';
import 'package:hal/eye.dart';
import 'package:hal/timer.dart';

final DateTime _time = DateTime.now().add(Duration(seconds: 100));

class HALHardware extends StatefulWidget {
  Function _callback;

  HALConsole console;
  HALTerminal terminal;

  HALHardware(HALTerminal terminal, Function callback) {
    this._callback = callback;
    this.terminal = terminal;
    this.console = HALConsole(this.terminal);
  }

  @override
  _HALHardwareState createState() => _HALHardwareState();
}

class _HALHardwareState extends State<HALHardware> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // alignment: AlignmentDirectional.center,
        children: <Widget>[
          Eye(120.0, this.widget._callback),
          Container(
            padding: EdgeInsets.only(top: 12.0, left: 4.0, right: 4.0),
            child: this.widget.console,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: ActivityTimer(
              "Wotking on HAL",
              _time,
            ),
          ),
        ],
      ),
    );
  }
}
