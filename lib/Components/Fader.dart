// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Fader extends StatelessWidget {
  final Widget child;
  const Fader({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return LinearGradient(colors: [
            ThemeColors.white.withOpacity(.005),
            ThemeColors.white.withOpacity(.2),
            ThemeColors.white.withOpacity(.75),
            ThemeColors.white.withOpacity(.99),
            ThemeColors.white,
          ], stops: [
            0.815,
            0.86,
            0.89,
            0.95,
            1
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              .createShader(bounds);
        },
        child: child);
  }
}
