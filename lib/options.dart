import 'package:flutter/material.dart';

enum OptionType {
  NewTimer,
  AddActivity,
  Settings,
  Done,
}

class Option {
  String name;
  Icon icon;
  OptionType type;

  Option(this.name, this.icon, this.type);
}

final List<Option> options = [
  Option("New Timer", Icon(Icons.add_alarm), OptionType.NewTimer),
  Option("Add Activity", Icon(Icons.add), OptionType.AddActivity),
  Option("Settings", Icon(Icons.settings), OptionType.Settings),
  Option("Done", Icon(Icons.check), OptionType.Done),
];

class Options extends StatefulWidget {
  Function(OptionType) _callback;
  bool _visible;

  Options({@required Function(OptionType) callback, @required bool visible}) {
    this._callback = callback;
    this._visible = visible;
  }

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: this.widget._visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ...options.map(
            (item) => FlatButton.icon(
              color: Colors.white,
              label: Text(item.name),
              icon: item.icon,
              clipBehavior: Clip.antiAlias,
              onPressed: () {
                if (this.widget._visible) {
                  this.widget._callback(item.type);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
