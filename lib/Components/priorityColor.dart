// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

Color colorUp(String str) {
  Color col = Colors.black38;
  for (var priority in priorities) {
    if (str == priority['Name']) col = priority['Color'];
  }
  return col;
}
