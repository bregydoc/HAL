import 'package:hal/activity.dart';
import 'package:pigment/pigment.dart';

/*
TaskRepresentation(
  "Lima Passport v6",
  Duration(hours: 8, minutes: 10, seconds: 25),
),
TaskRepresentation(
  "Project VIS, finding new techs",
  Duration(hours: 20, minutes: 15, seconds: 25),
),
TaskRepresentation(
  "Project HAL: creating a simple interface",
  Duration(days: 1, hours: 20, minutes: 10, seconds: 25),
),
TaskRepresentation(
  "Make my own vscode plugin",
  Duration(hours: 2, minutes: 10, seconds: 25),
),
TaskRepresentation(
  "Create an analytics framework",
  Duration(minutes: 1, seconds: 25),
),
TaskRepresentation(
  "Nothing more",
  Duration(days: 15, hours: 20, minutes: 18, seconds: 65),
),
*/

List<Activity> activities = [
  Activity(
    DateTime.parse("2019-09-15T16:20:10"),
    "Lima Passport v6",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
  Activity(
    DateTime.parse("2019-09-14T12:20:05"),
    "Project VIS, finding new techs",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
  Activity(
    DateTime.parse("2019-09-11T16:20:31"),
    "Project HAL: creating a simple interface",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
  Activity(
    DateTime.parse("2019-09-15T15:20:00"),
    "Make my own vscode plugin",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
  Activity(
    DateTime.parse("2019-09-13T20:20:12"),
    "Create an analytics framework",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
  Activity(
    DateTime.parse("2019-09-12T01:20:53"),
    "Nothing more",
    0.1,
    Pigment.fromCSSColor(CSSColor.aqua),
  ),
];
