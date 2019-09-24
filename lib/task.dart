import 'package:flutter/material.dart';
import 'package:hal/utils.dart';
import 'package:pigment/pigment.dart';

class TaskRepresentation extends StatelessWidget {
  final String _taskName;
  final Color _textWhiteColor = Pigment.fromString("white");
  final Color _textDarkColor = Pigment.fromString("black");
  final double _textWorkingOnSize = 14.0;
  final double _textSize = 18.0;
  final double _textDurationSize = 28.0;

  final Duration _totalTime;

  TaskRepresentation(this._taskName, this._totalTime);

  @override
  Widget build(BuildContext context) {
    final String _finalDuration = Utils.duration2hal(_totalTime);
    
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              "Working on",
              style: TextStyle(
                color: _textWhiteColor.withAlpha(180),
                fontSize: _textWorkingOnSize,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            color: _textWhiteColor,
            child: Padding(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              child: Text(
                _taskName,
                maxLines: 1,
                style: TextStyle(
                  color: _textDarkColor,
                  fontSize: _textSize,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 10.0),
            child: Container(
              child: Text(
                _finalDuration,
                style: TextStyle(
                  fontSize: _textDurationSize,
                  color: _textWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
