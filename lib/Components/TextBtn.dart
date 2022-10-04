// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class TxtBtn extends StatefulWidget {
  final String str;
  final EdgeInsets pad;
  final Color start;
  final Color hover;
  final double siz;
  final void Function() onPressed;
  const TxtBtn(
      {Key? key,
      required this.str,
      this.pad = EdgeInsets.zero,
      required this.start,
      required this.hover,
      required this.siz,
      required this.onPressed})
      : super(key: key);

  @override
  State<TxtBtn> createState() => _TxtBtnState();
}

class _TxtBtnState extends State<TxtBtn> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.05, 1.025);
    final transform = hovered ? hoveredTransform : Matrix4.identity();
    return Padding(
      padding: widget.pad,
      child: MouseRegion(
          cursor: MouseCursor.uncontrolled,
          onEnter: (event) => onEntered(true),
          onHover: (event) => onEntered(true),
          onExit: (event) => onEntered(false),
          child: AnimatedContainer(
              transform: transform,
              duration: Duration(milliseconds: 250),
              child: InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: widget.onPressed,
                child: Text(
                  widget.str,
                  style: TextStyle(
                    color: hovered ? widget.hover : widget.start,
                    fontFamily: 'Sans',
                    fontSize: widget.siz,
                  ),
                  //  textDirection: TextDecoration.underline ,
                ),
              ))),
    );
  }

  void onEntered(bool isHovered) => setState(() => hovered = isHovered);
}
