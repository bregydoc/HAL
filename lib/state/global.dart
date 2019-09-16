import 'package:flutter/cupertino.dart';

class GlobalState {
  static bool interacting = false;
  static Function onInteractCallback = () {
    interacting = !interacting;
  };
}
