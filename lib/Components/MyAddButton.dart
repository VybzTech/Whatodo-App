// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class MyAddButton extends StatefulWidget {
  final String symbol;
  final dynamic fnc;
  final double textSize;
  final FontWeight wei;
  bool cursor;

  MyAddButton({
    Key? key,
    required this.symbol,
    required this.fnc,
    required this.textSize,
    required this.wei,
    this.cursor = false,
  }) : super(key: key);

  @override
  State<MyAddButton> createState() => _MyAddButtonState();
}

class _MyAddButtonState extends State<MyAddButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 450),
      height: widget.cursor ? 47 : 50,
      width: widget.cursor ? 47 : 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ThemeColors.blueDark.withOpacity(0.75),
                offset: Offset(1.5, 2.5),
                blurRadius: 7.0),
          ],
          shape: BoxShape.circle,
          border: Border.all(
              width: 2.5,
              color: ThemeColors.blueDark.withOpacity(0.5),
              style: BorderStyle.solid),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [ThemeColors.blue, ThemeColors.blueDark])),
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            widget.cursor = value;
          });
        },
        onTap: widget.fnc,
        child: Center(
          child: MontText(
            color: widget.cursor ? Colors.white30 : Colors.white,
            text: widget.symbol,
            weight: widget.wei,
            size: widget.textSize,
          ),
        ),
      ),
    );
  }
}
