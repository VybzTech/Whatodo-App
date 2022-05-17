// ignore_for_file: file_names, avoid_init_to_null, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Input extends StatefulWidget {
  final String hint;
  final dynamic suffixIcon;
  final String error;
  final int high;
  final double height;
  final TextAlign align;
  final bool prefixed;
  final dynamic prefixIcon;
  final dynamic prefixSize;
  final TextEditingController controller;

  const Input({
    Key? key,
    this.prefixed = false,
    required this.hint,
    this.suffixIcon = null,
    this.prefixSize = null,
    this.prefixIcon = null,
    this.high = 1,
    this.height = 41.0,
    this.error = '',
    this.align = TextAlign.left,
    required this.controller,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return WhiteBox(
      width: double.maxFinite,
      radius: 7,
      height:
          widget.high > 1 ? (widget.high - 2) * widget.height : widget.height,
      shadow: ThemeColors.lightGray.withOpacity(.4),
      spread: 0.25,
      blur: 8,
      child: TextFormField(
        controller: widget.controller,
        maxLines: 10,
        minLines: widget.high,
        textCapitalization: TextCapitalization.words,
        cursorWidth: 2,
        cursorHeight: L - 2,
        cursorColor: ThemeColors.blueBlack.withOpacity(.5),
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.align,
        decoration: InputDecoration(
          hintText: widget.hint,
          isDense: true,
          filled: true,
          fillColor: Colors.white54,
          focusColor: Colors.white,
          contentPadding: EdgeInsets.all(S - 2),
          hoverColor: Colors.white70,
          border: InputBorder.none,
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(
          //       color: ThemeColors.lightGray.withOpacity(.5), width: 2),
          //   borderRadius: BorderRadius.circular(XS - 1.5),
          // ),

          hintStyle: TextStyle(
              color: ThemeColors.lightGray,
              fontFamily: 'Sans',
              letterSpacing: -0.25,
              fontSize: S + 2.7),
          prefixIcon: widget.prefixed
              ? Padding(
                  padding: const EdgeInsets.only(
                    right: XS + 2,
                    left: XS + 2,
                  ),
                  child: Icon(
                    widget.prefixIcon,
                    size: widget.prefixSize,
                    color: ThemeColors.gray,
                  ),
                )
              : SizedBox(
                  width: S,
                ),
          prefixIconConstraints: BoxConstraints(maxHeight: widget.prefixSize),
        ),
      ),
    );
  }
}
