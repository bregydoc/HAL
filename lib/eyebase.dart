import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class EyeBase extends StatelessWidget {
  final double _size;
  final Color _color = Pigment.fromString("#FF2020");
  EyeBase(this._size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_size * 0.7)),
            color: _color,
          ),
          height: _size * 0.75,
          width: _size * 0.75,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_size * 0.8)),
            color: _color.withAlpha(120),
          ),
          height: _size * 0.85,
          width: _size * 0.85,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_size)),
            color: _color.withAlpha(80),
          ),
          height: _size,
          width: _size,
        ),
      ],
    );
  }
}

class EyeIris extends StatelessWidget {
  final double _size;
  final Color _color = Pigment.fromString("#FFD467");
  EyeIris(this._size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_size * 0.8)),
            color: _color,
          ),
          height: _size * 0.7,
          width: _size * 0.7,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_size)),
            color: _color.withAlpha(80),
          ),
          height: _size,
          width: _size,
        ),
      ],
    );
  }
}

class Eye extends StatelessWidget {
  final double _size;

  Eye(this._size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        EyeBase(_size),
        EyeIris(_size*0.2),
      ],
    );
  }
}
