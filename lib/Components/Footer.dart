// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Footer extends StatelessWidget {
  final bool Light;
  const Footer({Key? key, required this.Light}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: L / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'Images/VybzTech-Logo-${Light ? 'Light' : 'Dark'}.png',
              fit: BoxFit.contain,
              width: 13,
              height: 13,
            ),
          ),
          SizedBox(width: XS - 2),
          MontText(
              text: 'VybzTech',
              color: Light
                  ? ThemeColors.whitishBlue.withOpacity(.9)
                  : ThemeColors.blueBlack.withOpacity(.8),
              weight: FontWeight.w400,
              size: S - 1,
              letter: .3)
        ],
      ),
    );
  }
}
