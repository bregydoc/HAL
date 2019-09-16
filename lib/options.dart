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

class Options extends StatelessWidget {
  Function(OptionType) _callback;

  final List<Option> options = [
    Option("New Timer", Icon(Icons.add_alarm), OptionType.NewTimer),
    Option("Add Activity", Icon(Icons.add), OptionType.AddActivity),
    Option("Settings", Icon(Icons.settings), OptionType.Settings),
    Option("Done", Icon(Icons.check), OptionType.Done),
  ];

  Options({@required Function(OptionType) callback}) {
    this._callback = callback;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ...options.map(
            (item) => FlatButton.icon(
              color: Colors.white,
              label: Text(item.name),
              icon: item.icon,
              clipBehavior: Clip.antiAlias,
              onPressed: () => {this._callback(item.type)},
            ),
          ),
        ],
      ),
    );
  }
}
