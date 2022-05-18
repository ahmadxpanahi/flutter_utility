import 'package:flutter/material.dart';

class Global {
  static Color color = Colors.blueAccent;
  static PickerType pickerType = PickerType.date;
  static var disable;
  static var min;
  static var max;
}

enum PickerType {
  datetime,
  date,
  time,
  rangedate,
  month,
  year,
  day,
}
