import 'package:flutter/material.dart';

class ActivityTimer extends StatelessWidget {
  final String _name;

  ActivityTimer(this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              color: Colors.white,
              child: Text(_name),
            ),
          )
        ],
      ),
    );
  }
}
