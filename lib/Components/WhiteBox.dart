// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class WhiteBox extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final double blur;
  final Widget child;
  final double spread;
  final Color shadow;
  final EdgeInsets pad;
  final EdgeInsets marg;
  final Color bg;

  WhiteBox({
    Key? key,
    this.bg = Colors.white,
    required this.height,
    required this.width,
    this.radius = S,
    this.blur = S,
    required this.child,
    this.spread = 0.1,
    this.shadow = Colors.white60,
    this.pad = EdgeInsets.zero,
    this.marg = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: pad,
        margin: marg,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: ThemeColors.offWhite),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                  color: shadow,
                  spreadRadius: spread,
                  blurRadius: blur,
                  offset: const Offset(0.0, 1.0))
            ]),
        child: child,
      );
}
