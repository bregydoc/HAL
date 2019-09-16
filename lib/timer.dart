import 'package:flutter/material.dart';

class ActivityTimer extends StatelessWidget {
  final String _name;
  final DateTime _endDate;
  ActivityTimer(this._name, this._endDate);

  @override
  Widget build(BuildContext context) {
    Duration dur = DateTime.now().difference(this._endDate);
    final int days = dur.inDays;
    final int hours = (dur.inHours - dur.inDays * 24);
    final int minutes = (dur.inMinutes - dur.inHours * 60);
    final int seconds = (dur.inSeconds - dur.inMinutes * 60);

    final String _finalDuration = days > 0
        ? "${days}d ${hours}h ${minutes}m ${seconds}s"
        : hours > 0
            ? "${hours}h ${minutes}m ${seconds}s"
            : minutes > 0
                ? "${minutes}m ${seconds}s"
                : seconds > 0 ? "${seconds}s" : "";

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              color: Colors.white,
              child: Text(_name),
            ),
          ),
          Container(
            child: Text(_finalDuration),
          )
        ],
      ),
    );
  }
}
