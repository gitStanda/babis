import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// BARCODE SCAN ICON
Icon barcodeScanIconBlack = Icon(CupertinoIcons.barcode_viewfinder,
    weight: 700, opticalSize: 48, grade: 0.25, size: 88, color: Colors.grey[850]);

const Icon barcodeScanIconWhite = Icon(CupertinoIcons.barcode_viewfinder,
    weight: 700, opticalSize: 48, grade: 0.25, size: 88, color: Colors.white);

// TYPE CODE ICON
Icon typeCodeIconBlack = Icon(
  CupertinoIcons.pen,
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 88,
  color: Colors.grey[850],
);

const Icon typeCodeIconWhite = Icon(
  CupertinoIcons.pen,
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 88,
  color: Colors.white,
);

const menuIcon = Icon(
  CupertinoIcons.line_horizontal_3,
);
// NAVIGATION MAIN PAGE
// const Icon navMain = Icon(
//   Symbols.home,
//   fill: 1,
//   weight: 700,
//   opticalSize: 48,
//   grade: 0.25,
//   size: 30,
// );

//  NAVIGATION SETTINGS
// const Icon navSettings = Icon(
//   Symbols.settings,
//   fill: 1,
//   weight: 700,
//   opticalSize: 48,
//   grade: 0.25,
//   size: 30,
// );

// SETTINGS DARK MODE
const Icon darkIcon = Icon(
  CupertinoIcons.lightbulb_slash,
);

// SETTINGS LIGHT MODE
const Icon lightIcon = Icon(
  CupertinoIcons.lightbulb_fill,
);

// RESULT BAD
const Icon badResultIcon = Icon(
  CupertinoIcons.clear,
  color: Colors.red,
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 130,
);

// RESULT GOOD
Icon goodResultIcon = Icon(
  CupertinoIcons.check_mark,
  color: Colors.green[800],
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 130,
);

// NO RESULT YET
Icon noResultIcon = const Icon(
  CupertinoIcons.hand_draw_fill,
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 100,
);

// IDK RESULT
Icon idkResultIcon = const Icon(
  CupertinoIcons.question,
  weight: 700,
  opticalSize: 48,
  grade: 0.25,
  size: 130,
);

// camera hint bolt
const Icon boltIcon = Icon(
  CupertinoIcons.bolt_fill,
);

// camera hint bolt
const Icon boltIconSlashed = Icon(
  CupertinoIcons.bolt_slash_fill,
);

// settings info icon
const settingsInfoIcon = CupertinoIcons.info_circle;
