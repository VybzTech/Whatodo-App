// ignore_for_file: file_names, avoid_init_to_null, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Input extends StatefulWidget {
  final String hint;
  final int version;
  final double height;
  final TextAlign align;
  final IconData prefixIcon;
  final double prefixSize;
  final TextEditingController controller;
  final dynamic node;
  final Color fillColor;
  final double radius;
  const Input({
    Key? key,
    required this.hint,
    required this.version,
    required this.controller,
    required this.prefixIcon,
    this.height = 40,
    this.radius = 7,
    this.prefixSize = M - 3,
    this.align = TextAlign.left,
    this.node = null,
    this.fillColor = Colors.white54,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    Widget Input = TextFormField(
        focusNode: widget.node,
        controller: widget.controller,
        textCapitalization: TextCapitalization.words,
        cursorWidth: 2,
        cursorHeight: L - 1.5,
        cursorColor: ThemeColors.blueBlack.withOpacity(.5),
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.align,
        decoration: InputDecoration(
            hintText: widget.hint,
            isDense: true,
            filled: true,
            fillColor: widget.fillColor,
            focusColor: ThemeColors.white,
            contentPadding: EdgeInsets.all(S - 1.5),
            hoverColor: Colors.white70,
            border: InputBorder.none,
            hintStyle: TextStyle(
                // color: Colors.transparent,
                color: ThemeColors.lightGray,
                fontFamily: 'Sans',
                letterSpacing: -0.25,
                fontSize: S + 2.7),
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: XS - 2),
                child: Icon(
                  widget.prefixIcon,
                  size: widget.prefixSize,
                  color: ThemeColors.gray,
                ))));
    if (widget.version == 1) {
      return WhiteBox(
          width: double.maxFinite,
          radius: widget.radius,
          height: widget.height,
          shadow: ThemeColors.lightGray.withOpacity(.4),
          spread: 0.25,
          blur: 8,
          child: Input);
    } else {
      return Input;
    }
  }
}
