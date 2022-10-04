// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class Fader extends StatelessWidget {
  final Widget child;
  final Color col;
  const Fader(
      {Key? key, required this.child, this.col = const Color(0xfff5f5fA)})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => LinearGradient(colors: [
            col.withOpacity(.005),
            col.withOpacity(.2),
            col.withOpacity(.75),
            col.withOpacity(.99),
            col,
          ], stops: [
            0.815,
            0.86,
            0.89,
            0.95,
            1
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              .createShader(bounds),
      child: child);
}
