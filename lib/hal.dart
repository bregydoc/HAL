import 'package:flutter/material.dart';
import 'package:hal/eye.dart';

class HALHardware extends StatefulWidget {
  final Function _callback;

  HALHardware(this._callback);
  @override
  _HALHardwareState createState() => _HALHardwareState();
}

class _HALHardwareState extends State<HALHardware> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Eye(120.0, this.widget._callback),
        ],
      ),
    );
  }
}
