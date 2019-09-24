import 'package:flutter/material.dart';

class HALTerminal {
  String terminalContent = "";

  say(String some) {
    terminalContent += some;
  }

  command(String command) {
    terminalContent += command + "\n";
  }
}

class HALConsole extends StatefulWidget {
  final HALTerminal _terminal;

  HALConsole(this._terminal);

  @override
  _HALConsoleState createState() => _HALConsoleState();
}

class _HALConsoleState extends State<HALConsole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      height: 76.0,
      width: MediaQuery.of(context).size.width * 0.84,
      color: Colors.white10,
      child: Stack(
        children: <Widget>[
          Text(
            this.widget._terminal.terminalContent,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
