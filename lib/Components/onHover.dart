// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Hovered extends StatefulWidget {
  final Widget child;
  bool hovered;
  Hovered({Key? key, required this.child, required this.hovered})
      : super(key: key);

  @override
  State<Hovered> createState() => _HoveredState();
}

class _HoveredState extends State<Hovered> {
  // bool hovered = false;
  @override
  Widget build(BuildContext context) {
    // final hoveredTransform = Matrix4.identity()..scale(1.075);
    // final transform = hovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
        cursor: MouseCursor.uncontrolled,
        onEnter: (event) => onEntered(true),
        onHover: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        child: widget.child);

    // AnimatedContainer(
    //     transform: transform,
    //     duration: Duration(milliseconds: 250),
    //     child: widget.child));
  }

  void onEntered(bool isHovered) => setState(() => widget.hovered = isHovered);
}
