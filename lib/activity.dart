import 'package:flutter/material.dart';
import 'package:hal/task.dart';

class Activity {
  final DateTime _startAt;
  final String _name;
  final double _progress;
  final Color _color;

  double get progress => _progress;
  Color get color => _color;

  Activity(this._startAt, this._name, this._progress, this._color);

  Duration get duration => DateTime.now().difference(this._startAt);

  Widget get representation => TaskRepresentation(_name, duration);
}
