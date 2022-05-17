// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class MyAddButton extends StatelessWidget {
  final String symbol;
  final dynamic fnc;
  final double textSize;
  final FontWeight wei;

  const MyAddButton({
    Key? key,
    required this.symbol,
    required this.fnc,
    required this.textSize,
    required this.wei,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fnc,
      child: Container(
        height: 47.0,
        width: 47.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.blueDark.withOpacity(0.75),
                  offset: Offset(1.5, 2.5),
                  blurRadius: 7.0),
            ],
            border: Border.all(
                color: ThemeColors.blueDark.withOpacity(0.5),
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [ThemeColors.blue, ThemeColors.blueDark])),
        child: Center(
          child: MontText(
            text: symbol,
            weight: wei,
            size: textSize,
          ),
        ),
      ),
    );
  }
}
