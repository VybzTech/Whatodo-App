// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Option extends StatelessWidget {
  final String name;
  final Color col;
  final Color border;
  const Option(
      {Key? key, required this.name, required this.col, required this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: S + 2.5,
              width: S + 2.5,
              decoration: BoxDecoration(
                  color: col,
                  border: Border.all(
                    color: border,
                  ),
                  borderRadius: BorderRadius.circular(3))),
          SizedBox(width: XS),
          SansText(
            text: name,
            weight: FontWeight.w400,
            size: S + 4,
            letter: -.2,
            color: ThemeColors.blueBlack.withOpacity(.7),
          )
        ]);
  }
}
