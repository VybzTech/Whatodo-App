// ignore_for_file: prefer_if_null_operators, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Option.dart';
import 'package:whatodo/Styles.dart';

class Select extends StatefulWidget {
  const Select({
    Key? key,
  }) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  List<String> options = [
    'None',
    'Business',
    'Low',
    'Average',
    'Casual',
    'Medium',
    'High',
    'Very High',
  ];

  String dropDownValue = 'None';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        iconSize: L - 3,
        value: dropDownValue,
        items: options
            .map((prior) => DropdownMenuItem(
                value: prior,
                child: Option(name: prior, col: ThemeColors.gray)))
            .toList(),
        onChanged: (dynamic val) {
          setState(() {
            dropDownValue = val!;
          });
        },
      ),
    );
  }
}
