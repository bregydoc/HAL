import "package:flutter/material.dart";
import 'package:hal/eyebase.dart';

class Eye extends StatelessWidget {
  final double _size;
  final Function _callback;
  Eye(this._size, this._callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _callback,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          EyeBase(_size),
          EyeIris(_size * 0.2),
        ],
      ),
    );
  }
}
