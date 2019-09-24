import 'package:flutter/material.dart';
import 'package:hal/utils.dart';
import 'package:pigment/pigment.dart';

class ActivityTimer extends StatelessWidget {
  final String _name;
  final DateTime _endDate;
  ActivityTimer(this._name, this._endDate);

  final Color _textWhiteColor = Pigment.fromString("white");
  final Color _textDarkColor = Pigment.fromString("black");
  final double _textWorkingOnSize = 14.0;
  final double _textSize = 18.0;
  final double _textDurationSize = 24.0;

  @override
  Widget build(BuildContext context) {
    Duration dur = this._endDate.difference(DateTime.now());
    final String _finalDuration = Utils.duration2hal(dur);

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              color: Colors.white,
              child: Text(
                _name,
                style: TextStyle(
                  color: _textDarkColor,
                  fontSize: _textSize,
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              _finalDuration,
              style: TextStyle(
                color: _textWhiteColor,
                fontSize: _textDurationSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
