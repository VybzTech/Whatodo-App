// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Option extends StatelessWidget {
  final String name;
  final Color col;
  const Option({Key? key, required this.name, required this.col})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: S + 2.5,
          width: S + 2.5,
          decoration: BoxDecoration(
              color: col,
              border: Border.all(
                color: col,
              ),
              borderRadius: BorderRadius.circular(4)),
        ),
        SizedBox(
          width: XS,
        ),
        SansText(
          text: name,
          weight: FontWeight.w400,
          size: S + 1.5,
          letter: -.2,
          color: ThemeColors.blueBlack.withOpacity(.7),
        )
      ],
    );
  }
}
